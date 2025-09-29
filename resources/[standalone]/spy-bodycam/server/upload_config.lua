Upload = Upload or {}

-- U have to start the recording using /recordcam and the recording will be uploaded to any of the service below.

Upload.ServiceUsed = 'discord'   -- discord | fivemanage | fivemerr
Upload.Token = 'MTM3NjE2ODM1NDM5MzQ4OTQ0OA.GUQSCy.apwmuq3ZiwnNAAnTeSNam2CNPFZ8dEgwcBlx8M'      --  fivemanage or fivemerr | [*note - for discord webhook is to be changed below not here]

-- FOR DISCORD LOGS
Upload.DiscordLogs = {
    Enabled = false,
    Username = 'Deanix Bodycam Records',     -- Bot Username
    Title = 'Bodycam Records',            -- Message Title
}

-- Upload Hooks if Upload.ServiceUsed = discord
Upload.DefaultUploads = {   -- Default Upload of log if job not mentioned in Upload.JobUploads. 
    webhook = 'https://discord.com/api/webhooks/1381919782663622676/bkNzEzl0-fEbKQQEhqOaShXxVcVcphiGPBvHIE83ySZOnk2NheaPqL81pUzgFEMIUsRv',
    author = {
        name = "Deanix Bodycam",
        icon_url = "https://i.imgur.com/tMyAdkz.png"
    }
}

Upload.JobUploads = {  -- Job Speific Uploads
    ['police'] = {
        webhook = 'https://discord.com/api/webhooks/1381919782663622676/bkNzEzl0-fEbKQQEhqOaShXxVcVcphiGPBvHIE83ySZOnk2NheaPqL81pUzgFEMIUsRv',
        author = {
            name = "Police Department",
            icon_url = "https://i.imgur.com/tMyAdkz.png"
        }
    }, -- Add more here
}
