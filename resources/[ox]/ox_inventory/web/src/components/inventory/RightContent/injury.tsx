import { useEffect, useState } from 'react';
import { getItemUrl } from '../../../helpers';
import { fetchNui } from '../../../utils/fetchNui';

const getSeverityColor = (level: number): string => {
  switch (level) {
    case 1:
      return '#ffeb3b';
    case 2:
      return '#ff9800';
    case 3:
      return '#f44336';
    case 4:
      return '#d32f2f';
    default:
      return '#ffffff';
  }
};

type InjuryProps = {
  level: number;
  key: string;
};

const Injury = () => {
  const [data, setData] = useState<InjuryProps[]>([]);

  useEffect(() => {
    fetchNui<InjuryProps[]>(
      'getInjury',
      undefined,
      Object.keys(InjuryData).map((key) => ({ key, level: 0 }))
    ).then(setData);
  }, []);

  return (
    <>
      <div style={{ display: 'flex', justifyContent: 'center', position: 'relative' }}>
        <img
          src={getItemUrl('inven')}
          style={{
            width: 'auto',
            height: '500px',
            margin: '10px 20px',
            filter: 'drop-shadow(10px 40px 50px rgba(0,0,0,0.5))',
          }}
        />

        {data.map((item) => {
          return <InjuryItem key={item.key} value={{ level: item.level, position: InjuryData[item.key].position }} />;
        })}
      </div>
    </>
  );
};

export default Injury;

const InjuryItem = ({ value }: { value: { level: number; position: { x: number; y: number } } }) => {
  return (
    <div style={{ position: 'absolute', left: value.position.x, top: value.position.y }}>
      <div
        style={{
          position: 'relative',
          width: 25,
          height: 25,
          borderRadius: '50%',
          background: `radial-gradient(circle, ${getSeverityColor(value.level)}20 20%, ${getSeverityColor(
            value.level
          )}80 80%, ${getSeverityColor(value.level)} 100%)`,
          boxShadow: `0 0 ${6 + value.level * 2}px ${2 + value.level}px ${getSeverityColor(value.level)}40`,
          border: `2px solid ${getSeverityColor(value.level)}`,
          animation: value.level >= 1 ? `pulse ${5 - value.level}s infinite` : 'none',
        }}
      ></div>
    </div>
  );
};

const InjuryData: Record<
  string,
  {
    level: number;
    position: { x: number; y: number };
  }
> = {
  HEAD: {
    level: 1,
    position: { x: 100, y: 0 },
  },
  NECK: {
    level: 2,
    position: { x: 100, y: 45 },
  },
  UPPER_BODY: {
    level: 4,
    position: { x: 100, y: 90 },
  },
  SPINE: {
    level: 3,
    position: { x: 100, y: 140 },
  },
  LOWER_BODY: {
    level: 1,
    position: { x: 100, y: 220 },
  },

  LARM: {
    level: 2,
    position: { x: 40, y: 100 },
  },
  LHAND: {
    level: 3,
    position: { x: 40, y: 180 },
  },
  LFINGER: {
    level: 4,
    position: { x: 25, y: 260 },
  },

  RARM: {
    level: 3,
    position: { x: 155, y: 100 },
  },
  RHAND: {
    level: 4,
    position: { x: 160, y: 180 },
  },
  RFINGER: {
    level: 1,
    position: { x: 170, y: 260 },
  },

  LLEG: {
    level: 1,
    position: { x: 70, y: 320 },
  },
  LFOOT: {
    level: 2,
    position: { x: 65, y: 430 },
  },

  RLEG: {
    level: 2,
    position: { x: 135, y: 320 },
  },
  RFOOT: {
    level: 3,
    position: { x: 132, y: 430 },
  },
};
