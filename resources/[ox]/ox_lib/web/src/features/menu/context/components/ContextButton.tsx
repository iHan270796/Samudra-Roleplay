import { Button, createStyles, Group, HoverCard, Image, Progress, Stack, Text, Flex } from '@mantine/core';
import ReactMarkdown from 'react-markdown';
import { ContextMenuProps, Option } from '../../../../typings';
import { fetchNui } from '../../../../utils/fetchNui';
import { isIconUrl } from '../../../../utils/isIconUrl';
import { IconProp } from '@fortawesome/fontawesome-svg-core';
import MarkdownComponents from '../../../../config/MarkdownComponents';
import LibIcon from '../../../../components/LibIcon';

const openMenu = (id: string | undefined) => {
  fetchNui<ContextMenuProps>('openContext', { id, back: false });
};

const clickContext = (id: string) => {
  fetchNui('clickContext', id);
};

const useStyles = createStyles((theme, params: { disabled?: boolean; readOnly?: boolean }) => ({
  inner: { justifyContent: 'flex-start' },
  label: { width: '100%', color: '#ffffff', whiteSpace: 'pre-wrap' },
  button: {
    height: 'fit-content',
    width: '100%',
    padding: '10px 14px',
    background: 'linear-gradient(145deg, rgba(0, 115, 255, 0.18), rgba(0, 85, 255, 0.49))',
    boxShadow: 'inset 3px 0 6px rgba(0,0,0,0.6), 0 4px 10px rgba(0,0,0,0.4)',
    border: '1px solid rgba(59, 181, 246, 0.6)',
    borderRadius: 8,
    fontFamily: '"Poppins", sans-serif',
    color: '#e0f4ff',
    fontSize: 13,
    transition: 'background 0.2s, transform 0.1s',
    cursor: params.readOnly ? 'default' : 'pointer',
    '&:hover': { backgroundColor: '#5392ff9f' },
    '&:active': { transform: params.readOnly ? 'none' : 'scale(0.97)' },
    '&:disabled': { opacity: 0.5, backgroundColor: '#1d405eff', cursor: 'not-allowed' },
  },
  iconImage: { maxWidth: '25px', color: '#ffffff' },
  description: { color: '#ffffff', fontSize: 12 },
  dropdown: {
    padding: 10,
    color: '#e0f4ff',
    backgroundColor: 'rgba(0, 174, 255, 0.18)',
    border: '2px solid rgba(59, 221, 246, 0.6)',
    borderRadius: 8,
    backdropFilter: 'blur(5px)',
    fontSize: 14,
    maxWidth: 350,
    width: 'fit-content',
    fontFamily: '"Poppins", sans-serif',
    maxHeight: 300,
    overflowY: 'auto',
    overflowX: 'hidden',
    display: 'flex',
    alignItems: 'flex-start',
    justifyContent: 'flex-start',
  },
  buttonGroup: { gap: 4, flexWrap: 'nowrap' },
  buttonIconContainer: { width: 25, height: 25, justifyContent: 'center', alignItems: 'center' },
  buttonTitleText: { overflowWrap: 'break-word', color: '#ffffff' },
  buttonArrowContainer: { justifyContent: 'center', alignItems: 'center', width: 25, height: 25 },
}));

const ContextButton: React.FC<{ option: [string, Option] }> = ({ option }) => {
  const button = option[1];
  const buttonKey = option[0];
  const { classes } = useStyles({ disabled: button.disabled, readOnly: button.readOnly });

  // Cek apakah tombol punya hover content
  const hasHoverContent = !!button.image || (Array.isArray(button.metadata) && button.metadata.length > 0);

  return (
    <HoverCard position="left-start" disabled={button.disabled || !hasHoverContent} openDelay={200}>
      <HoverCard.Target>
        <Button
          classNames={{ inner: classes.inner, label: classes.label, root: classes.button }}
          onClick={() =>
            !button.disabled && !button.readOnly
              ? button.menu
                ? openMenu(button.menu)
                : clickContext(buttonKey)
              : null
          }
          variant="default"
          disabled={button.disabled}
        >
          <Group position="apart" w="100%" noWrap>
            <Flex justify="space-between" align="center" w="100%">
              <Group className={classes.buttonGroup} noWrap>
                {button?.icon && (
                  <Stack className={classes.buttonIconContainer}>
                    {typeof button.icon === 'string' && isIconUrl(button.icon) ? (
                      <img src={button.icon} className={classes.iconImage} alt="Missing img" />
                    ) : (
                      <LibIcon
                        icon={button.icon as IconProp}
                        fixedWidth
                        size="lg"
                        style={{ color: button.iconColor }}
                        animation={button.iconAnimation}
                      />
                    )}
                  </Stack>
                )}
                <Text className={classes.buttonTitleText}>
                  <ReactMarkdown components={MarkdownComponents}>{button.title || buttonKey}</ReactMarkdown>
                </Text>
              </Group>

              {button.description && (
                <Text
                  className={classes.description}
                  style={{
                    fontSize: 12,
                    color: '#ffffff',
                    maxWidth: 180,
                    textAlign: 'right',
                    marginLeft: 16,
                    whiteSpace: 'nowrap',
                    overflow: 'hidden',
                    textOverflow: 'ellipsis',
                  }}
                >
                  <ReactMarkdown components={MarkdownComponents}>{button.description}</ReactMarkdown>
                </Text>
              )}
            </Flex>

            {(button.menu || button.arrow) && button.arrow !== false && (
              <Stack className={classes.buttonArrowContainer}>
                <LibIcon icon="chevron-right" fixedWidth />
              </Stack>
            )}
          </Group>

          {button.progress !== undefined && (
            <Progress mt={4} value={button.progress} size="sm" color={button.colorScheme || 'dark.3'} />
          )}
        </Button>
      </HoverCard.Target>

      {hasHoverContent && (
        <HoverCard.Dropdown
          className={classes.dropdown}
          style={{
            minHeight: button.metadata && button.metadata.length > 1 ? 150 : 'auto',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
        >
          <Flex direction="row" gap="lg" align="center" justify="center" wrap="nowrap" style={{ width: '100%' }}>
            {button.image && (
              <Flex align="center" justify="center" style={{ height: '100%' }}>
                <Image
                  src={button.image}
                  fit="contain"
                  style={{ maxWidth: 200, maxHeight: 120, borderRadius: 6, objectFit: 'contain' }}
                />
              </Flex>
            )}
            {Array.isArray(button.metadata) && (
              <Flex direction="row" gap="md" wrap="wrap" align="center" justify="center" style={{ height: '100%' }}>
                {button.metadata.map(
                  (
                    metadata: string | { label: string; value?: any; progress?: number; colorScheme?: string },
                    index: number
                  ) => (
                    <Flex key={`context-metadata-${index}`} direction="column" align="center" justify="center" style={{ minWidth: 60 }}>
                      <Text size="xs">
                        {typeof metadata === 'string' ? metadata : `${metadata.label}: ${metadata?.value ?? ''}`}
                      </Text>
                      {typeof metadata === 'object' && metadata.progress !== undefined && (
                        <Progress
                          value={metadata.progress}
                          size="xs"
                          w={50}
                          color={metadata.colorScheme || button.colorScheme || 'blue'}
                        />
                      )}
                    </Flex>
                  )
                )}
              </Flex>
            )}
          </Flex>
        </HoverCard.Dropdown>
      )}
    </HoverCard>
  );
};

export default ContextButton;
