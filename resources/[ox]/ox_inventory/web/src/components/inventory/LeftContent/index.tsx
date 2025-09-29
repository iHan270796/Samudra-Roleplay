import LeftInventory from '../LeftInventory';
import OtherInventory from '../OtherInventory';
import './style.scss';

const LeftContent = () => {
  return (
    <div className="content grid-perspective-left">
      <LeftInventory />
      <OtherInventory />
    </div>
  );
};

export default LeftContent;
