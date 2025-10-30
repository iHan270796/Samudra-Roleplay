import React, { useEffect, useMemo, useRef, useState } from 'react';
import { useDrop } from 'react-dnd';
import { Inventory, DragSource, SlotWithItem } from '../../typings';
import { Locale } from '../../store/locale';
import { getItemUrl } from '../../helpers';
import { useAppSelector } from '../../store';
import { Items } from '../../store/items';
import { BsPlusSquare } from "react-icons/bs";
import { FaMinus, FaPlus, FaRegTrashCan } from "react-icons/fa6";
import { LuCoins  } from "react-icons/lu";
import { RiBankCard2Line  } from "react-icons/ri";
import { onBuy } from '../../dnd/onBuy';

const ShopCart: React.FC<{ inventory: Inventory }> = ({ inventory }) => {
  const isBusy = useAppSelector((state) => state.inventory.isBusy);
  const [sourcee, setSourcee] = useState<DragSource | null>(null);
  const [cartItems, setCartItems] = useState<{ 
    name: string; 
    quantity: number; 
    price: number; 
    slot: number; 
    currency: string; 
    rarity: string;
    metadata?: any; // Store full metadata
  }[]>([]);
  const [onlyCash, setOnlyCash] = useState<boolean>(false);
  const [onlyBlackMoney, setOnlyBlackMoney] = useState<boolean>(false);
  const [inventoryType, setInventoryType] = useState<string>('');

  // Helper function to get the full item data from shop inventory
  const getShopItemData = (slot: number): SlotWithItem | undefined => {
    return inventory.items.find((item: any) => item.slot === slot) as SlotWithItem;
  };

  useEffect(() => {
    const handleAddToCart = (event: CustomEvent) => {
      const source = event.detail as DragSource;
      
      if (!sourcee) setSourcee(source);
      if (inventoryType === '') setInventoryType(source.inventory);
      
      const existingItem = cartItems.find((item) => item.name === source.item.name && item.slot === source.item.slot);
      const shopItem = getShopItemData(source.item.slot);
      
      if (existingItem) {
        setCartItems((prev) =>
          prev.map((item) =>
            item.name === source.item.name && item.slot === source.item.slot
              ? { ...item, quantity: item.quantity + 1 }
              : item
          )
        );
      } else {
        setCartItems((prev) => [
          ...prev,
          {
            name: source.item.name,
            quantity: 1,
            price: source.item.price ?? 0,
            slot: source.item.slot,
            currency: source.item.currency ?? 'money',
            rarity: source.item.rarity ?? 'common',
            metadata: shopItem?.metadata // Store the full metadata
          }
        ]);
        
        if (source.item.currency !== 'money') setOnlyCash(true);
        if (source.item.currency === 'black_money') {
          setOnlyBlackMoney(true);
        }
      }
    };

    window.addEventListener('addToShoppingCart', handleAddToCart as EventListener);

    return () => {
      window.removeEventListener('addToShoppingCart', handleAddToCart as EventListener);
    };
  }, [cartItems, sourcee, inventoryType, inventory]);

  const [{ isOver }, drop] = useDrop({
    accept: 'SLOT',
    drop: (source: DragSource) => {
      if (!sourcee) setSourcee(source);
      if (inventoryType === '') setInventoryType(source.inventory);
      
      const existingItem = cartItems.find((item) => item.name === source.item.name && item.slot === source.item.slot);
      const shopItem = getShopItemData(source.item.slot);
      
      if (existingItem) {
        setCartItems((prev) =>
          prev.map((item) =>
            item.name === source.item.name && item.slot === source.item.slot
              ? { ...item, quantity: item.quantity + 1 }
              : item
          )
        );
      } else {
        setCartItems((prev) => [
          ...prev,
          {
            name: source.item.name,
            quantity: 1,
            price: source.item.price ?? 0,
            slot: source.item.slot,
            currency: source.item.currency ?? '',
            rarity: source.item.rarity ?? 'common',
            metadata: shopItem?.metadata // Store the full metadata
          }
        ]);
        
        if (source.item.currency !== 'money') setOnlyCash(true);
        if (source.item.currency === 'black_money') {
          setOnlyBlackMoney(true);
        }
      }
    },
    collect: (monitor) => ({
      isOver: monitor.isOver(),
    }),
  });

  const handlePay = (type: string) => {
    if (!sourcee || cartItems.length === 0) return;
    
    // Pass all cart items instead of just the first one
    onBuy(sourcee, { inventory: inventoryType, item: { slot: -1 } }, 0, type, cartItems);
    
    // Clear the cart after payment
    setCartItems([]);
    setOnlyCash(false);
    setOnlyBlackMoney(false);
  };

  // Helper function to get item image URL with metadata support
  const getCartItemImage = (item: any) => {
    // First check metadata for image
    if (item.metadata?.imageurl) {
      return item.metadata.imageurl;
    }
    if (item.metadata?.image) {
      return item.metadata.image.startsWith('http') 
        ? item.metadata.image 
        : getItemUrl(item.metadata.image);
    }
    // Fallback to regular item image
    return getItemUrl(item.name);
  };

  // Helper function to get item label with metadata support
  const getItemLabel = (item: any) => {
    // First check metadata for label
    if (item.metadata?.label) {
      return item.metadata.label;
    }
    // Then check Items table
    if (Items[item.name]?.label) {
      return Items[item.name].label;
    }
    // Fallback to formatting the item name
    return item.name
      ?.replace(/[_-]/g, ' ')
      .replace(/\b\w/g, (char: string) => char.toUpperCase());
  };

  return (
    <>
      <div className="inventory-grid-wrapper w-full transform py-5 px-6 bg-black/25 rounded-[8px] miring transition-all duration-500 ease-in-out h-auto" style={{ pointerEvents: isBusy ? 'none' : 'auto', transform: inventory.type === 'player' || inventory.type === 'backpack' ? 'rotateX(0deg) rotateY(7deg)' : 'rotateX(0deg) rotateY(-7deg)' }}>
        <div>
          <div className="inventory-grid-header-wrapper border-b-2 border-white/20 pb-3">
            <div className='flex items-center justify-start gap-5'>
              <p className="text-md font-semibold text-berjarak">Shopping Cart</p>
            </div>
          </div>
          <div className='grid grid-cols-1 gap-2 h-[10.7rem] overflow-y-auto mt-4 no-scrollbar' ref={drop}>
            {cartItems.length > 0 ? (
              cartItems.map((item, index) => (
                <div key={`${item.name}-${item.slot}-${index}`} className='flex items-center justify-start gap-3 w-full box-cart min-h-[5rem] max-h-[5rem] px-7 py-2 rounded-[8px]'>
                  <img 
                    src={getCartItemImage(item)} 
                    alt={item.name} 
                    className='w-[15%] ml-[-1rem] h-full object-contain' 
                    style={{ imageRendering: '-webkit-optimize-contrast' }}
                  />
                  <div className='flex flex-col items-start justify-center w-[35%]'>
                    <p className={`text-md font-semibold truncate max-w-full ml-[-.5rem] rarity-${(item.metadata?.rarity || item.rarity || 'common').toLowerCase()}`}>
                      {(item.metadata?.rarity || item.rarity || 'common').toUpperCase()}
                    </p>
                    <p className='text-md font-semibold truncate max-w-full mb-[.25rem] ml-[-.5rem]'>
                      {getItemLabel(item)}
                    </p>
                  </div>
                  <div className='flex flex-row items-center justify-between gap-1 flex-1'>
                    <button 
                      className='flex items-center justify-center w-6 h-6 bg-gray/50 text-white/50 iconText font-semibold border border-white/20' 
                      onClick={() => setCartItems((prev) => prev.map((cartItem) => 
                        cartItem.name === item.name && cartItem.slot === item.slot && cartItem.quantity > 1 
                          ? { ...cartItem, quantity: cartItem.quantity - 1 } 
                          : cartItem
                      ))}
                    >
                      <FaMinus />
                    </button>
                    <input 
                      type='number' 
                      className='w-12 h-7 rounded-md bg-black/0 text-white text-sm font-semibold text-center outline-none' 
                      value={item.quantity} 
                      onChange={(e) => {
                        const value = Math.max(1, Number(e.target.value));
                        setCartItems((prev) => prev.map((cartItem) => 
                          cartItem.name === item.name && cartItem.slot === item.slot 
                            ? { ...cartItem, quantity: value } 
                            : cartItem
                        ));
                      }} 
                    />
                    <button 
                      className='flex items-center justify-center w-6 h-6 bg-gray/50 text-white/50 iconText font-semibold border border-white/20' 
                      onClick={() => setCartItems((prev) => prev.map((cartItem) => 
                        cartItem.name === item.name && cartItem.slot === item.slot 
                          ? { ...cartItem, quantity: cartItem.quantity + 1 } 
                          : cartItem
                      ))}
                    >
                      <FaPlus />
                    </button>
                  </div>
                  <p className="text-md font-normal text-white/50 w-[18%] text-right mt-[0.15rem]">
                    {Locale.$ || '$'}
                    {(item.price * item.quantity).toLocaleString('en-us')}
                  </p>
                  <button 
                    className='flex items-center justify-center w-7 h-7 text-white text-2xl font-extrabold trashCanIco' 
                    onClick={() => setCartItems((prev) => prev.filter((cartItem) => 
                      !(cartItem.name === item.name && cartItem.slot === item.slot)
                    ))}
                  >
                    <FaRegTrashCan />
                  </button>
                </div>
              ))
            ) : (
              <div className='flex flex-col items-center justify-center w-full bg-red-400/0 min-h-[5rem]'>
                <BsPlusSquare className="text-5xl text-white/40 pb-[1rem]" />
                <p className="uppercase text-white/50 dragShopItemText">drag shop items here</p>
                <p className="text-white/50 uppercase alternativeShopText">alternatively, double click or shift + click</p>
              </div>
            )}
          </div>
          <div className='flex flex-col w-full mt-4 border-t-2 border-white/20 pt-2 transition-all duration-200'>
            {cartItems.length > 0 && (
              <>
                <div className='flex items-center justify-between w-full'>
                  <p className='text-md font-normal uppercase text-white/80 mt-[0.3rem]'>Total Cost</p>
                  <p className='text-lg font-normal uppercase text-white/90 mt-[0.3rem]'>
                    {Locale.$ || '$'}
                    {cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0).toLocaleString('en-us')}
                  </p>
                </div>
                {onlyCash && !onlyBlackMoney && (
                  <div className='flex items-center justify-between w-full'>
                    <p className='text-md font-normal uppercase'>Total Cost</p>
                    <p className='text-lg font-normal uppercase text-white/100'>
                      {Locale.$ || '$'}
                      {cartItems
                        .filter((item) => item.currency !== 'money')
                        .reduce((acc, item) => acc + item.price * item.quantity, 0)
                        .toLocaleString('en-us')}
                    </p>
                  </div>
                )}
                <div className='flex items-center justify-end w-full gap-3.5 mt-2'>
                  {!onlyCash && (
                    <button className='flex flex-row gap-2 items-center justify-center w-auto px-3 h-10 rounded-sm bg-black/50 text-white/70 hover:text-white text-md font-semibold border border-white/20 hover:bg-[var(--color-secondary)] hover:border-[rgb(var(--color-primary)/0.6)] transition-all duration-200' onClick={() => handlePay('bank')}>
                      <RiBankCard2Line className='text-lg'/>
                      <p>Pay Bank</p>
                    </button>
                  )}
                  {onlyBlackMoney && (
                    <button className='flex flex-row gap-2 items-center justify-center w-auto px-3 h-10 rounded-sm bg-black/50 text-white/70 hover:text-white text-md font-semibold border border-white/20 hover:bg-[var(--color-secondary)] hover:border-[rgb(var(--color-primary)/0.6)] transition-all duration-200' onClick={() => handlePay('black_money')}>
                      <LuCoins className='text-lg'/>
                      <p>Pay Dirty Money</p>
                    </button>
                  )}
                  {!onlyBlackMoney && (
                    <button className='flex flex-row gap-2 items-center justify-center w-auto px-3 h-10 rounded-sm bg-black/50 text-white/70 hover:text-white text-md font-semibold border border-white/20 hover:bg-[var(--color-secondary)] hover:border-[rgb(var(--color-primary)/60)] transition-all duration-200' onClick={() => handlePay('cash')}>
                      <LuCoins className='text-lg'/>
                      <p>Pay Cash</p>
                    </button>
                  )}
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </>
  );
};

export default ShopCart;