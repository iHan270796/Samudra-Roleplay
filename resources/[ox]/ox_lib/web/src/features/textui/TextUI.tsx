import React from 'react';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { Box, createStyles, Group } from '@mantine/core';
import ReactMarkdown from 'react-markdown';
import ScaleFade from '../../transitions/ScaleFade';
import remarkGfm from 'remark-gfm';
import type { TextUiPosition, TextUiProps } from '../../typings';
import MarkdownComponents from '../../config/MarkdownComponents';
import LibIcon from '../../components/LibIcon';

const useStyles = createStyles((theme, params: { position?: TextUiPosition }) => ({
  wrapper: {
    height: '100%',
    width: '100%',
    position: 'absolute',
    display: 'flex',
    alignItems:
      params.position === 'top-center' ? 'baseline' :
      params.position === 'bottom-center' ? 'flex-end' : 'center',
    justifyContent:
      params.position === 'right-center' ? 'flex-end' :
      params.position === 'left-center' ? 'flex-start' : 'center',
  },
  container: {
    position: 'relative',
    fontSize: 16,
    padding: 12,
    margin: 8,
    backgroundColor: 'rgba(0, 106, 255, 0.31)',
    color: theme.white,
    fontFamily: 'Roboto',
    borderRadius: '4px',
    border: '1px solid #29afb9',
    backgroundImage: 'url(/src/blur.png)',
    backgroundRepeat: 'repeat',
    backgroundSize: 'auto',
    backgroundPosition: 'center',
    backgroundBlendMode: 'overlay',
    boxShadow: `
        inset 3px 0 6px rgba(0,0,0,0.6),
        0 4px 10px rgba(0,0,0,0.4)
      `,
    maxWidth: '400px',      
    wordBreak: 'break-word',
    lineHeight: 1.4,      
  },
  corner: {
  position: 'absolute',
  width: 12,
  height: 12,
  borderColor: '#33bcc6ff',
  pointerEvents: 'none',
  borderRadius: 2,
  zIndex: 10,
},
topLeft: {
  top: 0,
  left: 0,
  borderTop: '3px solid #33bcc6ff',
  borderLeft: '3px solid #33bcc6ff',
  // borderTopLeftRadius: 4,
  transform: 'translate(-3px, -3px)',
},
topRight: {
  top: 0,
  right: 0,
  borderTop: '3px solid #33bcc6ff',
  borderRight: '3px solid #33bcc6ff',
  // borderTopRightRadius: 4,
  transform: 'translate(3px, -3px)',
},
bottomLeft: {
  bottom: 0,
  left: 0,
  borderBottom: '3px solid #33bcc6ff',
  borderLeft: '3px solid #33bcc6ff',
  // borderBottomLeftRadius: 4,
  transform: 'translate(-3px, 3px)',
},
bottomRight: {
  bottom: 0,
  right: 0,
  borderBottom: '3px solid #33bcc6ff',
  borderRight: '3px solid #33bcc6ff',
  // borderBottomRightRadius: 4,
  transform: 'translate(3px, 3px)',
},
}));

const TextUI: React.FC = () => {
  const [data, setData] = React.useState<TextUiProps>({
    text: '',
    position: 'right-center',
  });
  const [visible, setVisible] = React.useState(false);
  const { classes, cx } = useStyles({ position: data.position });

  useNuiEvent<TextUiProps>('textUi', (data) => {
    if (!data.position) data.position = 'right-center';
    setData(data);
    setVisible(true);
  });

  useNuiEvent('textUiHide', () => setVisible(false));

  return (
    <Box className={classes.wrapper}>
      <ScaleFade visible={visible}>
        <Box style={data.style} className={classes.container}>
          {/* Corner lines */}
          <span className={cx(classes.corner, classes.topLeft)} />
          <span className={cx(classes.corner, classes.topRight)} />
          <span className={cx(classes.corner, classes.bottomLeft)} />
          <span className={cx(classes.corner, classes.bottomRight)} />

          <Group spacing={12}>
  {data.icon && (
    <LibIcon
      icon={data.icon}
      fixedWidth
      size="lg"
      animation={data.iconAnimation}
      style={{
        // color: data.iconColor || '#0149ffff',
        color: data.iconColor,
        alignSelf:
          !data.alignIcon || data.alignIcon === 'center'
            ? 'center'
            : 'start',
      }}
    />
  )}
  <ReactMarkdown
    components={MarkdownComponents}
    remarkPlugins={[remarkGfm]}
  >
    {data.text}
  </ReactMarkdown>
</Group>
        </Box>
      </ScaleFade>
    </Box>
  );
};

export default TextUI;
