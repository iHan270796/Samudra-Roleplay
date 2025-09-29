import { ItemData } from '../typings/item';

export const Items: {
  [key: string]: ItemData | undefined;
} = {
  water: {
    name: 'water',
    close: false,
    label: 'VODA',
    stack: true,
    usable: true,
    count: 0,
  },
  burger: {
    name: 'burger',
    close: false,
    label: 'BURGR',
    stack: false,
    usable: false,
    count: 0,
  },
  bag: {
    name: 'bag',
    close: false,
    label: 'Bag',
    stack: false,
    usable: false,
    count: 0,
    buttons: [{ label: 'Open Bag', action: 'open_bag' }],
  },
  armour: {
    name: 'armour',
    close: false,
    label: 'armour',
    stack: false,
    usable: false,
    count: 0,
  },
  phone: {
    name: 'phone',
    close: false,
    label: 'phone',
    stack: false,
    usable: false,
    count: 0,
  },
  lockpick: {
    name: 'lockpick',
    close: false,
    label: 'Lockpick',
    count: 0,
    stack: false,
    usable: true,
  },
};
