import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectOtherInventory } from '../../store/inventory';

const OtherInventory: React.FC = () => {
  const otherInventory = useAppSelector(selectOtherInventory);

  if (otherInventory.id == '') return null;

  return <InventoryGrid inventory={otherInventory} />;
};

export default OtherInventory;
