import React from 'react';
import { Box, createStyles, Text } from '@mantine/core';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { fetchNui } from '../../utils/fetchNui';
import type { ProgressbarProps } from '../../typings';

const useStyles = createStyles((theme) => ({
  wrapper: {
    position: 'fixed',
    bottom: '3%',
    left: 0,
    right: 0,
    margin: '0 auto',
    width: '19%',
    zIndex: 1000,
    fontFamily: '"Pathway Gothic One", sans-serif',
    fontSize: '1.7vh',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  labels: {
    width: '100%',
    display: 'flex',
    justifyContent: 'space-between',
    marginBottom: '4px',
  },
  label: {
    color: '#ffffff',
    fontWeight: 'bold',
    lineHeight: '4vh',
  },
  percentage: {
    color: '#0051ffff',
    fontWeight: 'bold',
    lineHeight: '4vh',
  },
  barContainer: {
    width: '100%',
    height: '0.9vh',
    borderRadius: '4px',
    backgroundImage: `repeating-linear-gradient(
      135deg,
      #8286867e,
      #8286867e 1.4px,
      transparent 3px,
      transparent 4px
    )`,
  },
  bar: {
    height: '0.9vh',
    backgroundColor: '#0033ff8f',
    borderRadius: '4px',
    boxShadow: '0 0 30px rgba(0, 64, 255, 0.3)',
    // transition: 'width 0.3s ease-out',
  },
}));

const Progressbar: React.FC = () => {
  const { classes } = useStyles();
  const [visible, setVisible] = React.useState(false);
  const [label, setLabel] = React.useState('');
  const [duration, setDuration] = React.useState(0);
  const [progress, setProgress] = React.useState(0);

  useNuiEvent('progressCancel', () => setVisible(false));

  useNuiEvent<ProgressbarProps>('progress', (data) => {
    setLabel(data.label);
    setDuration(data.duration);
    setProgress(0);
    setVisible(true);

    // Animate progress
    const start = performance.now();
    const animate = (now: number) => {
      const elapsed = now - start;
      const percent = Math.min((elapsed / data.duration) * 100, 100);
      setProgress(percent);

      if (percent < 100) {
        requestAnimationFrame(animate);
      } else {
        fetchNui('progressComplete');
        setTimeout(() => setVisible(false), 300); // Delay to show 100%
      }
    };

    requestAnimationFrame(animate);
  });

  if (!visible) return null;

  return (
    <Box className={classes.wrapper}>
      <div className={classes.labels}>
        <Text className={classes.label}>{label}</Text>
        <Text className={classes.percentage}>{Math.floor(progress)}%</Text>
      </div>
      <div className={classes.barContainer}>
        <div className={classes.bar} style={{ width: `${progress}%` }} />
      </div>
    </Box>
  );
};

export default Progressbar;
