import { BsBackpack3 } from 'react-icons/bs';
import { LuShieldPlus } from 'react-icons/lu';
import { MdPhoneIphone } from 'react-icons/md';
import { GiPistolGun, GiSawedOffShotgun } from 'react-icons/gi';
import { useAppSelector } from '../../../store';
import { selectLeftInventory } from '../../../store/inventory';
import InventorySlot from '../InventorySlot';
import { useIntersection } from '../../../hooks/useIntersection';
import Injury from './injury';
import { PiMoneyWavy } from "react-icons/pi";
type UtilitesItem = {
  type: string | number;
  icon?: React.ReactNode;
};

const UTILITIES_LEFT: UtilitesItem[] = [
  { type: 'backpack', icon: BsBackpack3({ size: 44 }) },
  { type: 'armor', icon: LuShieldPlus({ size: 44 }) },
  { type: 'phone', icon: MdPhoneIphone({ size: 44 }) },
];

const UTILITIES_RIGHT = [
  { type: 'money', icon: PiMoneyWavy({ size: 44 }), slot: 1 },
  { type: 2, icon: GiPistolGun({ size: 44 }), slot: 2 },
  { type: 3, icon: GiSawedOffShotgun({ size: 44 }), slot: 3 },
];

const UTILITIES_BOTTOM: UtilitesItem[] = [{ type: 6 }, { type: 5 }, { type: 4 }];

const Utility = () => {
  const inventory = useAppSelector(selectLeftInventory);
  const { ref } = useIntersection({ threshold: 0.5 });

  const left = inventory.items.slice(6, 9).map((item, index) => ({
    ...item,
    icon: UTILITIES_LEFT[index]?.icon,
  }));

  const right = inventory.items.slice(0, 3).map((item, index) => ({
    ...item,
    icon: UTILITIES_RIGHT[index]?.icon,
  }));

  const bottom = inventory.items.slice(3, 6).map((item, index) => ({
    ...item,
    icon: UTILITIES_BOTTOM[index]?.icon,
  }));

  return (
    <div className="utility">
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '10px',
        }}
      >
        <div className="utilities-side">
          {left.map((item, index) => (
            <InventorySlot
              key={`${inventory.type}-${inventory.id}-${item.slot}`}
              item={item}
              ref={index === left.length - 1 ? ref : null}
              inventoryType={inventory.type}
              inventoryGroups={inventory.groups}
              inventoryId={inventory.id}
              icon={item.icon}
            />
          ))}
        </div>
        <Injury />
        <div className="utilities-side">
          {right.map((item, index) => (
            <InventorySlot
              key={`${inventory.type}-${inventory.id}-${item.slot}`}
              item={item}
              ref={index === right.length - 1 ? ref : null}
              inventoryType={inventory.type}
              inventoryGroups={inventory.groups}
              inventoryId={inventory.id}
              icon={item.icon}
            />
          ))}
        </div>
      </div>
      <div className="utilities-bottom">
        {bottom.map((item, index) => (
          <InventorySlot
            key={`${inventory.type}-${inventory.id}-${item.slot}`}
            item={item}
            ref={index === bottom.length - 1 ? ref : null}
            inventoryType={inventory.type}
            inventoryGroups={inventory.groups}
            inventoryId={inventory.id}
            icon={item.icon}
          />
        ))}
      </div>
    </div>
  );
};

export default Utility;
