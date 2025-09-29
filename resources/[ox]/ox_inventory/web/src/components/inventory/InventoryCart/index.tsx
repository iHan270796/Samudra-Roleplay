import { useState } from 'react';
import { useDrop } from 'react-dnd';
import { LuMinus, LuPlus } from 'react-icons/lu';
import { DragSource, Slot, SlotWithItem } from '../../../typings';
import { Items } from '../../../store/items';
import './style.scss';
import { BsTrash } from 'react-icons/bs';
import { getItemUrl } from '../../../helpers';
import { fetchNui } from '../../../utils/fetchNui';

type CartItem = {
  name: string;
  count: number;
  price: number;
};

const ShopCart = ({ data }: { data: SlotWithItem[] }) => {
  const [items, setItems] = useState<CartItem[]>([]);

  const [_, drop] = useDrop<DragSource, void, { isOver: boolean; canDrop: boolean }>(
    () => ({
      accept: 'SLOT',
      drop: (dragged: DragSource) => {
        setItems((prev) => {
          const idx = prev.findIndex((i) => i.name === dragged.item.name);
          if (idx !== -1) {
            return prev.map((item, i) => (i === idx ? { ...item, count: item.count + 1 } : item));
          }
          return [
            ...prev,
            {
              name: dragged.item.name,
              count: 1,
              price: data.find((item) => item.name === dragged.item.name)?.price || 0,
            },
          ];
        });
      },
      collect: (monitor) => ({
        isOver: monitor.isOver(),
        canDrop: monitor.canDrop(),
      }),
    }),
    []
  );

  const setItemCount = (name: string, count: number) => {
    setItems((prev) => prev.map((item) => (item.name === name ? { ...item, count } : item)));
  };

  const removeItem = (name: string) => {
    setItems((prev) => prev.filter((item) => item.name !== name));
  };

  const handlePay = (method: 'cash' | 'bank') => {
    fetchNui<boolean>('payCart', { method, items }).then((success) => {
      if (success) {
        setItems([]);
      }
    });
  };

  const totalPrice = items.reduce((total, item) => total + item.price * item.count, 0);

  return (
    <div ref={drop} className="cart ">
      <div className="cart-title">Shopping Cart ({totalPrice})</div>
      <div className="cart-items">
        {items.length === 0 ? (
          <span>Drop items here</span>
        ) : (
          items.map((item, idx) => (
            <CartItem key={idx} item={item} setItemCount={setItemCount} removeItem={removeItem} />
          ))
        )}
      </div>
      <div style={{ display: 'flex', justifyContent: 'end', marginTop: '10px', gap: '10px' }}>
        <button className="card-pay-button" onClick={() => handlePay('cash')}>
          Pay with Cash
        </button>
        <button className="card-pay-button" onClick={() => handlePay('bank')}>
          Pay with Bank
        </button>
      </div>
    </div>
  );
};

export default ShopCart;

const CartItem = ({
  item,
  setItemCount,
  removeItem,
}: {
  item: CartItem;
  setItemCount: (name: string, count: number) => void;
  removeItem: (name: string) => void;
}) => {
  return (
    <div key={item.name} className="cart-item">
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          gap: '10px',
        }}
      >
        <img src={getItemUrl(item.name)} alt={Items[item.name]?.label || item.name} className="cart-item-image" />
        {Items[item.name]?.label || item.name}
      </div>
      <div className="cart-action">
        <button
          onClick={() => {
            if (item.count > 1) {
              setItemCount(item.name, item.count - 1);
            } else {
              removeItem(item.name);
            }
          }}
          className="button-cart"
        >
          {LuMinus({})}
        </button>
        <input
          className="input-cart"
          value={item.count}
          onChange={(e) => setItemCount(item.name, Number(e.target.value))}
        />
        <button
          onClick={() => {
            setItemCount(item.name, item.count + 1);
          }}
          className="button-cart"
        >
          {LuPlus({})}
        </button>
        <button className="button-cart destructive">{BsTrash({})}</button>
      </div>
    </div>
  );
};
