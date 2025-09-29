import { Button, createStyles } from '@mantine/core';
import { IconProp } from '@fortawesome/fontawesome-svg-core';
import LibIcon from '../../../../components/LibIcon';

interface Props {
  icon: IconProp;
  canClose?: boolean;
  iconSize: number;
  handleClick: () => void;
  type?: 'close' | 'back';
}

const useStyles = createStyles((theme, params: { canClose?: boolean; type?: 'close' | 'back' }) => ({
  button: {
    width: 45,
    height: 45,
    borderRadius: 6,
    padding: 0,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: '#fff',
    boxShadow: `
      inset 3px 0 6px rgba(0,0,0,0.6),
      0 4px 10px rgba(0,0,0,0.4)
    `,
    transition: 'background 0.2s ease',
    backgroundColor:
      params.type === 'back'
        ? 'rgba(0,115,255,0.33)'  
        : 'rgba(124,18,18,0.33)',  
    border:
      params.type === 'back'
        ? '1px solid rgba(0,115,255,0.8)' 
        : '1px solid #971a1aa5',          
    cursor: params.type === 'close' && params.canClose === false ? 'not-allowed' : 'pointer',
    opacity: params.type === 'close' && params.canClose === false ? 0.6 : 1,
    pointerEvents: params.type === 'close' && params.canClose === false ? 'none' : 'auto',
    '&:hover': {
      backgroundColor:
        params.type === 'back'
          ? '#0073ff99'  
          : '#971a1aa5',  
    },
  },
  label: {
    color: '#fff',
  },
}));

const HeaderButton: React.FC<Props> = ({
  icon,
  canClose,
  iconSize,
  handleClick,
  type = 'close',
  }) => {
    const { classes } = useStyles({ canClose, type });

  return (
    <Button
      variant="default"
      classNames={{
        root: classes.button,
        label: classes.label,
      }}
      onClick={handleClick}
    >
      <LibIcon icon={icon} fontSize={iconSize} fixedWidth />
    </Button>
  );
};

export default HeaderButton;
