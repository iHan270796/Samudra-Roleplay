import { Checkbox } from '@mantine/core';
import { ICheckbox } from '../../../../typings/dialog';
import { UseFormRegisterReturn } from 'react-hook-form';

interface Props {
  row: ICheckbox;
  index: number;
  register: UseFormRegisterReturn;
}

const CheckboxField: React.FC<Props> = (props) => {
  return (
    <Checkbox
      {...props.register}
      sx={{ display: 'flex' }}
      required={props.row.required}
      label={props.row.label}
      defaultChecked={props.row.checked}
      disabled={props.row.disabled}
      styles={{
        input: {
          backgroundColor: 'rgba(0, 123, 255, 0.1)',
          border: '1px solid #2980b9',                
          borderRadius: '6px',
          cursor: 'pointer',
          transition: '0.2s',
          '&:checked': {
            backgroundColor: '#2980b9',              
            borderColor: '#1f6391',
          },
        },
        icon: {
          color: '#ffffff', 
        },
        label: {
          color: 'white',   
          fontWeight: 500,
          marginLeft: '8px',
        },
      }}
    />
  );
};

export default CheckboxField;
