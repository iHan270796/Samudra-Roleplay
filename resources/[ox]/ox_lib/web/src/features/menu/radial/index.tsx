import { Box, createStyles } from '@mantine/core';
import { useEffect, useState } from 'react';
import { IconProp } from '@fortawesome/fontawesome-svg-core';
import { useNuiEvent } from '../../../hooks/useNuiEvent';
import { fetchNui } from '../../../utils/fetchNui';
import { isIconUrl } from '../../../utils/isIconUrl';
import ScaleFade from '../../../transitions/ScaleFade';
import type { RadialMenuItem } from '../../../typings';
import { useLocales } from '../../../providers/LocaleProvider';
import LibIcon from '../../../components/LibIcon';

const useStyles = createStyles((theme) => ({
  wrapper: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    minHeight: '100vh',
    perspective: '1000px',
  },
  menu: {
    margin: '0 auto',
    position: 'absolute',
    top: '37%',
    right: '20rem',
    width: '400px',
    height: '400px',
    zIndex: 9999,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    transform: 'rotateY(-20deg)',
    transformStyle: 'preserve-3d',
    transition: 'transform 0.5s ease-in-out',
  },
  centerBtn: {
    position: 'absolute',
    top: 'calc(50% - 15px)',
    left: '10%',
    transform: 'translate(-50%, -50%)',
    borderRadius: '8px',
    width: '48px',
    height: '48px',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    cursor: 'pointer',
    boxShadow: `
        inset 2px 0 5px rgba(0,0,0,0.6),
        0 4px 10px rgba(0,0,0,0.4)
      `,
    zIndex: 10000,
    transition: 'all 0.3s ease',
  },
  itemWrapper: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    textAlign: 'center',
  },
  itemLabel: {
    marginTop: 6,
    fontSize: 12,
    fontWeight: 500,
    color: '#ffffffff',
    textShadow: '0 0 3px rgba(21, 21, 21, 0.69)',
  },
  btn: {
    position: 'absolute',
    left: 0,
    listStyle: 'none',
    transformOrigin: '200px',
  },
  icon: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 106, 255, 0.19)',
    width: '60px',
    height: '60px',
    borderRadius: '8px',
    fontSize: '15px',
    boxShadow: `
        inset 1px 0 5px rgba(0,0,0,0.6),
        0 4px 10px rgba(0,0,0,0.4)
      `,
    cursor: 'pointer',
    border: '2px solid #29afb9',
    transition: 'all 0.3s cubic-bezier(.25, .8, .25, 1)',
    '&:hover': {
      backgroundColor: '#5392ff9f',
      border: '2px solid #29afb9',
      transform: 'scale(1.1)',
    },
  },
}));

function getItemRotation(index: number, total: number): number {
  if (total === 3) {
    return [270, 180, 0][index];
  } else if (total === 4) {
    return [270, 0, 90, 180][index];
  } else {
    return (360 / total) * index;
  }
}

const RadialMenu: React.FC = () => {
    const { classes } = useStyles();
    const { locale } = useLocales();
    const [visible, setVisible] = useState(false);
    const [menuItems, setMenuItems] = useState<RadialMenuItem[]>([]);
    const [menu, setMenu] = useState<{ items: RadialMenuItem[]; sub?: boolean }>({
        items: [],
        sub: false,
    });
    
    const [label, setLabel] = useState<string>('');
    const [isAnimating, setIsAnimating] = useState(false);
    const [animationRotation, setAnimationRotation] = useState(0);
    const [shouldReset, setShouldReset] = useState(false);

    useEffect(() => {
        setMenuItems(menu.items);
    }, [menu.items]);

    useNuiEvent('openRadialMenu', async (data: { items: RadialMenuItem[]; sub?: boolean; option?: string } | false) => {
        if (!data) return setVisible(false);
        setLabel('');
            setMenu({ ...data });
        setVisible(true);
    });

    useNuiEvent('refreshItems', (data: RadialMenuItem[]) => {
        setMenu({ ...menu, items: data });
    });
    return (
      <>
        <ScaleFade visible={visible}>
      <Box
        className={classes.wrapper}
        onContextMenu={() => {
  if (menu.sub) {
    if (isAnimating) return;

    fetchNui('radialBack');
    setAnimationRotation(0);
    setShouldReset(true);
    setIsAnimating(false);
    }
  }}
  >

  <div
  className={classes.menu}
  style={{
    transform:
      shouldReset || (!shouldReset && animationRotation === 0)
        ? 'rotateY(-20deg)'
        : `rotateY(${animationRotation}deg)`
  }}
>

  <div
  className={classes.centerBtn}
  style={{
    backgroundColor: menu.sub ? 'rgba(0, 102, 255, 0.46)' : 'rgba(124, 18, 18, 0.46)',
    border: menu.sub ? '1px solid #297bff' : '1px solid #971a1aa5',
  }}
  onClick={() => {
    if (menu.sub) {
      if (isAnimating) return;
      fetchNui('radialBack');
      setAnimationRotation(0);
      setShouldReset(true);
      setIsAnimating(false);
    } else {
      setVisible(false);
      fetchNui('radialClose');
    }
  }}
  title={menu.sub ? 'Kembali' : 'Tutup'}
  onMouseEnter={(e) => {
    (e.currentTarget as HTMLDivElement).style.backgroundColor = menu.sub ? '#297bffcc' : '#971a1ac7';
  }}
  onMouseLeave={(e) => {
    (e.currentTarget as HTMLDivElement).style.backgroundColor = menu.sub ? 'rgba(0, 102, 255, 0.46)' : 'rgba(124, 18, 18, 0.46)';
  }}
>
  <LibIcon
    icon={(menu.sub ? 'rotate-left' : 'xmark') as IconProp}
    width={10}
    height={10}
    color="#fff"
    fixedWidth
  />
  </div>
    {menuItems.map((item, index) => {
      const rotation = getItemRotation(index, menuItems.length);
      const radius = 200 + Math.max(0, menuItems.length - 8) * 5;
      return (
    <li
      key={index}
      className={classes.btn}
      style={{
      transform: `rotate(${rotation}deg) translate(${radius}px) rotate(-${rotation}deg)`,
      opacity: isAnimating ? 0 : 1,
      transition: `opacity 0.3s ease ${index * 60}ms, transform 0.3s ease`,
    }}
      onClick={async () => {
        fetchNui('radialClick', index);
    }}
    >
    <div className={classes.itemWrapper}>
      <a href="#" className={classes.icon}>
        {typeof item.icon === 'string' && isIconUrl(item.icon) ? (
          <image href={item.icon} width={60} height={60} />
        ) : (
          <LibIcon
            icon={item.icon as IconProp}
            width={60}
            height={60}
            color='#ececec'
            fontSize={28}
            fixedWidth
          />
            )}
                </a>
                  <span className={classes.itemLabel}>{item.label}</span>
                </div>
                </li>
              );
            })}
          </div>
        </Box >
      </ScaleFade>
    </>
  );
};

export default RadialMenu;