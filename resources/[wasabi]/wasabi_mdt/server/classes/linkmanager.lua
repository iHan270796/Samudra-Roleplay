-- ============================================
-- MDT Link Manager
-- Manages bidirectional relationships between entities
-- ============================================

MDTLinkManager = {}

-- ============================================
-- CORE LINKING FUNCTIONS
-- ============================================

function CreateLink(fromType, fromId, toType, toId, linkedBy, metadata)
    local linkExists = MySQL.scalar.await([[
SELECT 1 FROM wsb_mdt_entity_links 
          WHERE ((from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?)
          OR (from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?))
          LIMIT 1]], {
        fromType, tostring(fromId), toType, tostring(toId),
        toType, tostring(toId), fromType, tostring(fromId)
    })

    if linkExists then
        return false
    end

    metadata = metadata or {}
    metadata.linked_by = linkedBy
    metadata.linked_at = os.time()

    local insertId = MySQL.insert.await([[
INSERT INTO wsb_mdt_entity_links 
          (from_type, from_id, to_type, to_id, metadata, created_at)
          VALUES (?, ?, ?, ?, ?, ?)]], {
        fromType,
        tostring(fromId),
        toType,
        tostring(toId),
        json.encode(metadata),
        os.time()
    })

    return insertId ~= nil
end

MDTLinkManager.createLink = CreateLink

function RemoveLink(fromType, fromId, toType, toId)
    local rowsAffected = MySQL.update.await([[
DELETE FROM wsb_mdt_entity_links 
          WHERE ((from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?)
          OR (from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?))]], {
        fromType, tostring(fromId), toType, tostring(toId),
        toType, tostring(toId), fromType, tostring(fromId)
    })

    return rowsAffected > 0
end

MDTLinkManager.removeLink = RemoveLink

function IsLinked(fromType, fromId, toType, toId)
    local linkExists = MySQL.scalar.await([[
SELECT 1 FROM wsb_mdt_entity_links 
          WHERE ((from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?)
          OR (from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?))
          LIMIT 1]], {
        fromType, tostring(fromId), toType, tostring(toId),
        toType, tostring(toId), fromType, tostring(fromId)
    })

    return linkExists ~= nil
end

MDTLinkManager.isLinked = IsLinked

function UpdateLinkMetadata(fromType, fromId, toType, toId, metadata)
    metadata.updated_at = os.time()

    local rowsAffected = MySQL.update.await([[
UPDATE wsb_mdt_entity_links 
          SET metadata = ?
          WHERE ((from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?)
          OR (from_type = ? AND from_id = ? AND to_type = ? AND to_id = ?))]], {
        json.encode(metadata),
        fromType, tostring(fromId), toType, tostring(toId),
        toType, tostring(toId), fromType, tostring(fromId)
    })

    return rowsAffected > 0
end

MDTLinkManager.updateLinkMetadata = UpdateLinkMetadata

-- ============================================
-- ENTITY RETRIEVAL
-- ============================================

function GetLinkedEntities(entityType, entityId, filterType)
    local query = [[
        SELECT * FROM wsb_mdt_entity_links 
        WHERE (from_type = ? AND from_id = ?) 
        OR (to_type = ? AND to_id = ?)
    ]]
    local parameters = {entityType, tostring(entityId), entityType, tostring(entityId)}

    if filterType then
        query = [[
            SELECT * FROM wsb_mdt_entity_links 
            WHERE ((from_type = ? AND from_id = ? AND to_type = ?) 
            OR (to_type = ? AND to_id = ? AND from_type = ?))
        ]]
        parameters = {
            entityType, tostring(entityId), filterType,
            entityType, tostring(entityId), filterType
        }
    end

    local links = MySQL.query.await(query, parameters)
    local results = {}

    for _, link in ipairs(links or {}) do
        local linkedType = nil
        local linkedId = nil

        if link.from_type == entityType and link.from_id == tostring(entityId) then
            linkedType = link.to_type
            linkedId = link.to_id
        else
            linkedType = link.from_type
            linkedId = link.from_id
        end

        local entityData = MDTLinkManager.getEntityData(linkedType, linkedId)

        if entityData then
            table.insert(results, {
                type = linkedType,
                id = linkedId,
                data = entityData,
                metadata = json.decode(link.metadata),
                link_id = link.id,
                created_at = link.created_at
            })
        end
    end

    return results
end

MDTLinkManager.getLinkedEntities = GetLinkedEntities

function GetEntityData(entityType, entityId)
    if entityType == "citizen" then
        local entity = MDTCitizen.get(entityId)
        return (entity and entity:toTable()) or nil
    elseif entityType == "vehicle" then
        local entity = MDTVehicle.get(tonumber(entityId))
        return (entity and entity:toTable()) or nil
    elseif entityType == "weapon" then
        local entity = MDTWeapon.get(tonumber(entityId))
        return (entity and entity:toTable()) or nil
    elseif entityType == "property" then
        local entity = MDTProperty.get(tonumber(entityId))
        return (entity and entity:toTable()) or nil
    elseif entityType == "evidence" then
        local entity = MDTEvidence.get(tonumber(entityId))
        return (entity and entity:toTableLight()) or nil
    elseif entityType == "charge" then
        local entity = MDTCharge.get(tonumber(entityId))
        return (entity and entity:toTable()) or nil
    elseif entityType == "warrant" then
        local entity = MDTWarrant.get(tonumber(entityId))
        return (entity and entity:toTableLight()) or nil
    elseif entityType == "bolo" then
        local entity = MDTBOLO.get(tonumber(entityId))
        return (entity and entity:toTable()) or nil
    elseif entityType == "incident" then
        local entity = MDTIncident.get(tonumber(entityId))
        return (entity and entity:toTableLight()) or nil
    elseif entityType == "officer" then
        return Officers[entityId]
    end

    return nil
end

MDTLinkManager.getEntityData = GetEntityData

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================

function GetLinkStats(entityType, entityId)
    local stats = {}
    local linkedEntities = MDTLinkManager.getLinkedEntities(entityType, entityId)

    for _, link in ipairs(linkedEntities) do
        local linkType = link.type
        stats[linkType] = (stats[linkType] or 0) + 1
    end

    return stats
end

MDTLinkManager.getLinkStats = GetLinkStats

function RemoveAllLinks(entityType, entityId)
    local rowsAffected = MySQL.update.await([[
DELETE FROM wsb_mdt_entity_links 
          WHERE (from_type = ? AND from_id = ?) OR (to_type = ? AND to_id = ?)]], {
        entityType, tostring(entityId), entityType, tostring(entityId)
    })

    return rowsAffected
end

MDTLinkManager.removeAllLinks = RemoveAllLinks

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function CreateLinkManagerTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_entity_links'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_entity_links` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `from_type` VARCHAR(50) NOT NULL,
                `from_id` VARCHAR(50) NOT NULL,
                `to_type` VARCHAR(50) NOT NULL,
                `to_id` VARCHAR(50) NOT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_from` (`from_type`, `from_id`),
                INDEX `idx_to` (`to_type`, `to_id`),
                INDEX `idx_full` (`from_type`, `from_id`, `to_type`, `to_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_entity_links' has been created.")
        return true
    end

    return false
end

MDTLinkManager.createTable = CreateLinkManagerTable