import InventoryComponent from './components/inventory';
import useNuiEvent from './hooks/useNuiEvent';
import { Items } from './store/items';
import { Locale } from './store/locale';
import { setImagePath } from './store/imagepath';
import { setupInventory } from './store/inventory';
import { Inventory } from './typings';
import { useAppDispatch } from './store';
import { debugData } from './utils/debugData';
import DragPreview from './components/utils/DragPreview';
import { fetchNui } from './utils/fetchNui';
import { useDragDropManager } from 'react-dnd';
import KeyPress from './components/utils/KeyPress';

debugData([
  {
    action: 'setupInventory',
    data: {
      leftInventory: {
        id: 'test',
        type: 'player',
        slots: 50,
        label: 'Bob Smith',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            slot: 10,
            name: 'bag',
            weight: 100,
            count: 1,
          },
          { slot: 11, name: 'armour', weight: 100, count: 1 },
          { slot: 12, name: 'phone', weight: 100, count: 12, metadata: { type: 'Special' } },
          {
            slot: 13,
            name: 'water',
            weight: 100,
            count: 1,
            metadata: { description: 'Generic item description' },
          },
          { slot: 14, name: 'water', weight: 100, count: 1 },
          {
            slot: 15,
            name: 'water',
            weight: 100,
            count: 1,
          },
        ],
      },
      otherInventory : {
        id : 'textbag',
        type: 'container',
        slots: 100,
        label: 'Other Inventory',
        weight: 0,
        maxWeight: 10000,
        items: [],
      },
      rightInventory: {
        id: 'shop',
        type: 'shop',
        slots: 5000,
        label: 'Bob Smith',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            slot: 1,
            name: 'lockpick',
            weight: 500,
            price: 300,
            ingredients: {
              iron: 5,
              copper: 12,
              powersaw: 0.1,
            },
            metadata: {
              description: 'Simple lockpick that breaks easily and can pick basic door locks',
            },
          },
          {
            slot: 2,
            name: 'water',
            weight: 100,
            price: 50,
            ingredients: {
              iron: 0,
              copper: 0,
              powersaw: 0,
            },
            metadata: {
              description: 'A bottle of fresh water',
            },
          },
          {
            slot: 3,
            name: 'armour',
              weight: 100,
              price: 50,
              ingredients: {
                iron: 0,
                copper: 0,
                powersaw: 0,
              },
              metadata: {
                description: 'A bottle of fresh water',
            },
          },
        ],
      },
    },
  },
]);

const App: React.FC = () => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();

  useNuiEvent<{
    locale: { [key: string]: string };
    items: typeof Items;
    leftInventory: Inventory;
    imagepath: string;
  }>('init', ({ locale, items, leftInventory, imagepath }) => {
    for (const name in locale) Locale[name] = locale[name];
    for (const name in items) Items[name] = items[name];

    setImagePath(imagepath);
    dispatch(setupInventory({ leftInventory }));
  });

  fetchNui('uiLoaded', {});

  useNuiEvent('closeInventory', () => {
    manager.dispatch({ type: 'dnd-core/END_DRAG' });
  });

  return (
    <div className="app-wrapper">
      <InventoryComponent />
      <DragPreview />
      <KeyPress />
    </div>
  );
};

addEventListener('dragstart', function (event) {
  event.preventDefault();
});

export default App;
