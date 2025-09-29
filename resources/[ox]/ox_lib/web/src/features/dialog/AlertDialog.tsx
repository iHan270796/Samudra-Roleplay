import {
  Button,
  createStyles,
  Group,
  Modal,
  Stack,
  useMantineTheme,
} from '@mantine/core';
import { useState } from 'react';
import ReactMarkdown from 'react-markdown';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { fetchNui } from '../../utils/fetchNui';
import { useLocales } from '../../providers/LocaleProvider';
import remarkGfm from 'remark-gfm';
import type { AlertProps } from '../../typings';
import MarkdownComponents from '../../config/MarkdownComponents';

const useStyles = createStyles((theme) => ({
  contentStack: {
    color: theme.white,
  },
}));

const AlertDialog: React.FC = () => {
  const { locale } = useLocales();
  const { classes } = useStyles();
  const theme = useMantineTheme();
  const [opened, setOpened] = useState(false);
  const [dialogData, setDialogData] = useState<AlertProps>({
    header: '',
    content: '',
  });

  const closeAlert = (button: string) => {
    setOpened(false);
    fetchNui('closeAlert', button);
  };

  useNuiEvent('sendAlert', (data: AlertProps) => {
    setDialogData(data);
    setOpened(true);
  });

  useNuiEvent('closeAlertDialog', () => {
    setOpened(false);
  });

  return (
    <>
      <Modal
        opened={opened}
        centered={dialogData.centered}
        size={dialogData.size || 'md'}
        overflow={dialogData.overflow ? 'inside' : 'outside'}
        closeOnClickOutside={false}
        onClose={() => closeAlert('cancel')}
        withCloseButton={false}
        overlayOpacity={0.5}
        transition="fade"
        exitTransitionDuration={150}
        styles={{
          title: {
            color: '#ffffff',
            fontSize: '22px',
            fontWeight: 500,
          },
          modal: {
            position: 'relative',
            background: 'rgba(0, 106, 255, 0.17)',
            border: '1px solid rgba(59, 181, 246, 0.36)',
            borderRadius: '10px',
            backgroundImage: 'url(/src/blur.png)',
            backgroundRepeat: 'repeat',
            backgroundSize: 'auto',
            backgroundPosition: 'center',
            backgroundBlendMode: 'overlay',
            boxShadow: `
              inset 3px 0 6px rgba(0,0,0,0.6),
              0 4px 10px rgba(0,0,0,0.4)
              `,
            padding: '20px',
          },
        }}
        title={
          <ReactMarkdown components={MarkdownComponents}>
            {dialogData.header}
          </ReactMarkdown>
        }
        >
        <>
          <span
            style={{
              position: 'absolute',
              top: -3,
              left: -3,
              width: '25px',
              height: '25px',
              borderTop: '3px solid #29afb9',
              borderLeft: '3px solid #29afb9',
              borderTopLeftRadius: '10px',
            }}
          />
          <span
            style={{
              position: 'absolute',
              top: -3,
              right: -3,
              width: '25px',
              height: '25px',
              borderTop: '3px solid #29afb9',
              borderRight: '3px solid #29afb9',
              borderTopRightRadius: '10px',
            }}
          />
          <span
            style={{
              position: 'absolute',
              bottom: -3,
              left: -3,
              width: '25px',
              height: '25px',
              borderBottom: '3px solid #29afb9',
              borderLeft: '3px solid #29afb9',
              borderBottomLeftRadius: '10px',
            }}
          />
          <span
            style={{
              position: 'absolute',
              bottom: -3,
              right: -3,
              width: '25px',
              height: '25px',
              borderBottom: '3px solid #29afb9',
              borderRight: '3px solid #29afb9',
              borderBottomRightRadius: '10px',
            }}
          />
        </>

        <Stack className={classes.contentStack}>
          <ReactMarkdown
            remarkPlugins={[remarkGfm]}
            components={{
                ...MarkdownComponents,
                img: ({ ...props }) => (
                  <img
                    style={{ maxWidth: '100%', maxHeight: '100%' }}
                    {...props}
                  />
                ),
              }}
            >
              {dialogData.content}
            </ReactMarkdown>
          <Group position="right" spacing={10}>
        {dialogData.cancel && (
    <Button
      uppercase
      variant="filled"
      onClick={() => closeAlert('cancel')}
      styles={{
        root: {
          backgroundColor: 'rgba(124, 18, 18, 0.33)',
          color: 'white',
          fontWeight: 600,
          padding: '12px 24px',
          borderRadius: '6px',
          border: '1px solid #971a1aa5',
          outline: 'none',  
            '&:hover': {
              backgroundColor: '#971a1aa5',
          },
           '&:focus': {
              outline: 'none',
              boxShadow: 'none',
            },
          },
        }}
      >
        {dialogData.labels?.cancel || locale.ui.cancel}
          </Button>
            )}
            <Button
              uppercase
              variant="light"
              onClick={() => closeAlert('confirm')}
              styles={{
                root: {
                  backgroundColor: 'rgba(0, 76, 255, 0.19)',
                  color: 'white',
                  fontWeight: 600,
                  padding: '12px 24px',
                  borderRadius: '6px',
                  border: '1px solid #29afb9',
                  '&:hover': {
                    backgroundColor: '#5392ff9f',
                  },
                },
              }}
            >
              {dialogData.labels?.confirm || locale.ui.confirm}
            </Button>
          </Group>
        </Stack>
      </Modal>
    </>
  );
};

export default AlertDialog;
