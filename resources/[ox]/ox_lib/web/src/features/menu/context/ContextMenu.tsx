import { useNuiEvent } from '../../../hooks/useNuiEvent';
import { Box, createStyles, Flex, Stack, Text } from '@mantine/core';
import { useEffect, useState } from 'react';
import { ContextMenuProps } from '../../../typings';
import ContextButton from './components/ContextButton';
import { fetchNui } from '../../../utils/fetchNui';
import ReactMarkdown from 'react-markdown';
import HeaderButton from './components/HeaderButton';
import ScaleFade from '../../../transitions/ScaleFade';
import MarkdownComponents from '../../../config/MarkdownComponents';

const openMenu = (id: string | undefined) => {
  fetchNui<ContextMenuProps>('openContext', { id: id, back: true });
};

const useStyles = createStyles((theme, params: { hasBack: boolean }) => ({
  container: {
    visibility: 'hidden',
    opacity: 0,
    pointerEvents: 'none',
    position: 'absolute',
    top: '60%',  
    right: 355,
    transform: 'perspective(1300px) translateY(calc(-50% + 60px)) rotateX(2deg) rotateY(-6deg) rotate(0) scale(0.85)', 
    width: 450,
    height: '75vh',
    padding: 0,
    background: 'transparent',
    border: 'none',
    borderRadius: 0,
    boxShadow: 'none',
    transformStyle: 'flat',
    transformOrigin: 'center center',
    transition: 'transform 0.35s cubic-bezier(0.22, 1, 0.36, 1), opacity 0.25s',
    display: 'flex',
    flexDirection: 'column',
    zIndex: 9999,
    willChange: 'transform',
    backfaceVisibility: 'hidden',
  },

  containerActive: {
    visibility: 'visible',
    opacity: 1,
    pointerEvents: 'auto',
    transform: 'perspective(1300px) translateY(calc(-50% + 60px)) rotateX(2deg) rotateY(-6deg) rotate(0) scale(1)', 
  },
  
  containerHover: {
    transform: 'perspective(1300px) translateY(calc(-50% + 60px)) rotateX(3deg) rotateY(-10deg) scale(1.02)',
  },

  header: {
    position: 'relative',
    alignItems: 'center',
    marginBottom: 10,
    height: 32,
  },

  titleContainer: {
    borderRadius: 8,
    background: 'linear-gradient(145deg, rgba(0, 115, 255, 0.18), rgba(0, 85, 255, 0.49))',
    boxShadow: `
        inset 3px 0 6px rgba(0,0,0,0.6),
        0 4px 10px rgba(0,0,0,0.4)
      `,
    border: '1px solid rgba(59, 221, 246, 0.6)',
    minHeight: 48,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    paddingLeft: 0,           
    paddingRight: 0,          
  },

  titleText: {
    color: '#e0f4ff',
    fontWeight: 500,
    fontSize: 20,
    fontFamily: '"Poppins", sans-serif',
    lineHeight: 1.3,
    textAlign: 'center', 
    paddingLeft: 0,      
    paddingRight: 0,     
  },
  buttonsContainer: {
    maxHeight: '560px',      
    overflowY: 'scroll',       
    overflowX: 'hidden',
    paddingRight: 6,

    '&::-webkit-scrollbar': {
      width: 8,
    },
    '&::-webkit-scrollbar-track': {
      backgroundColor: 'rgba(53, 116, 251, 1)',
      borderRadius: 4,
      // border: '2px solid rgba(53, 116, 251, 1)',
    },
    '&::-webkit-scrollbar-thumb': {
      backgroundColor: 'rgba(59, 212, 246, 0.69) !important',
      borderRadius: 0,
      // border: '1px solid #000000aa',
    },
    '&::-webkit-scrollbar-thumb:hover': {
      backgroundColor: '#0466ff !important',
    },
  },
  buttonsFlexWrapper: {
    gap: 10,
  },
}));

const ContextMenu: React.FC = () => {
  const [isHovered, setIsHovered] = useState(false);
  const [visible, setVisible] = useState(false);
  const [contextMenu, setContextMenu] = useState<ContextMenuProps>({
    title: '',
    options: { '': { description: '', metadata: [] } },
  });

  const { classes } = useStyles({ hasBack: !!contextMenu.menu });

  const closeContext = () => {
    if (contextMenu.canClose === false) return;
    setVisible(false);
    fetchNui('closeContext');
  };

  useEffect(() => {
    if (!visible) return;

    const keyHandler = (e: KeyboardEvent) => {
      if (['Escape'].includes(e.code)) closeContext();
    };

    window.addEventListener('keydown', keyHandler);

    return () => window.removeEventListener('keydown', keyHandler);
  }, [visible]);

  useNuiEvent('hideContext', () => setVisible(false));

  useNuiEvent<ContextMenuProps>('showContext', async (data) => {
    if (visible) {
      setVisible(false);
      await new Promise((resolve) => setTimeout(resolve, 100));
    }
    setContextMenu(data);
    setVisible(true);
  });

  return (
    <Box
    className={`${classes.container} ${visible ? classes.containerActive : ''} ${isHovered ? classes.containerHover : ''}`}
    onMouseEnter={() => setIsHovered(true)}
    onMouseLeave={() => setIsHovered(false)}
  >
    <ScaleFade visible={visible}>
      <Flex
    className={classes.header}
    align="center"
    style={{
      display: 'grid',
      gridTemplateColumns: contextMenu.menu ? '48px 1fr auto' : '0px 1fr auto',
      alignItems: 'center',
      marginBottom: 10,
      height: 48,
      gap: contextMenu.menu ? 8 : 0,
    }}
  >
    {contextMenu.menu ? (
      <HeaderButton icon="chevron-left" iconSize={22} handleClick={() => openMenu(contextMenu.menu)} type="back" />
    ) : (
      <Box style={{ width: contextMenu.menu ? 48 : 0, height: 36 }} />
    )}
    <Box
      className={classes.titleContainer}
      style={{
        flex: 1,
        marginRight: contextMenu.menu ? 0 : 8,
      }}
    >
      <Text className={classes.titleText}>
        <ReactMarkdown components={MarkdownComponents}>{contextMenu.title}</ReactMarkdown>
      </Text>
    </Box>
    <Box style={{ paddingRight: 6 }}>
      <HeaderButton
        icon="xmark"
        canClose={contextMenu.canClose}
        iconSize={22}
        handleClick={closeContext}
      />
      </Box>
      </Flex>
      <Box className={classes.buttonsContainer}>
        <Stack className={classes.buttonsFlexWrapper}>
          {Object.entries(contextMenu.options).map((option, index) => (
            <ContextButton option={option} key={`context-item-${index}`} />
          ))}
        </Stack>
      </Box>
    </ScaleFade>
  </Box>
  );
};

export default ContextMenu;