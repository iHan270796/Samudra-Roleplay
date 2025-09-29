import { useEffect, useState } from 'react';
import RightInventory from '../RightInventory';
import './style.scss';
import Utility from './utility';
import useNuiEvent from '../../../hooks/useNuiEvent';

enum ViewType {
  INVENTORY = 'inventory',
  UTILITY = 'utility',
}

const RightContent = () => {
  const [view, setView] = useState<ViewType>(ViewType.UTILITY);

  useNuiEvent<ViewType>('setView', setView);

  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'q') {
        setView(ViewType.INVENTORY);
      } else if (event.key === 'e') {
        setView(ViewType.UTILITY);
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  return (
    <div className="content">
      <div className="buttons">
        <button
          onClick={() => setView(ViewType.INVENTORY)}
          className={view === ViewType.INVENTORY ? 'active-button' : ''}
        >
          [Q] Inventory
        </button>
        <button onClick={() => setView(ViewType.UTILITY)} className={view === ViewType.UTILITY ? 'active-button' : ''}>
          [E] Utility
        </button>
      </div>
      <div style={{}}>
        <div className=' grid-perspective-right'>{view === 'inventory' && <RightInventory />}</div>
        {view === 'utility' && <Utility />}
      </div>
    </div>
  );
};

export default RightContent;
