import { createStyles, PasswordInput, TextInput } from '@mantine/core';
import React from 'react';
import { IInput } from '../../../../typings/dialog';
import { UseFormRegisterReturn } from 'react-hook-form';
import LibIcon from '../../../../components/LibIcon';

interface Props {
  register: UseFormRegisterReturn;
  row: IInput;
  index: number;
}

const useStyles = createStyles((theme) => ({
  eyeIcon: {
    color: '#ffffff',
  },
}));

const InputField: React.FC<Props> = (props) => {
  const { classes } = useStyles();

  return (
    <>
      {!props.row.password ? (
        <TextInput
          {...props.register}
          defaultValue={props.row.default}
          label={props.row.label}
          description={props.row.description}
          icon={props.row.icon && <LibIcon icon={props.row.icon} fixedWidth />}
          placeholder={props.row.placeholder}
          styles={{
  input: {
    backgroundColor: 'rgba(0, 30, 255, 0.12)',
    border: '1px solid #2980b9',
    borderRadius: '6px',
    padding: '10px',
    fontSize: '14px',
    color: '#ffffff',
    transition: 'all 0.2s ease',
    '::placeholder': {
      color: 'rgba(255, 255, 255, 0.6)',
    },
  },
  label: {
    color: 'white',
    fontWeight: 600,
    fontSize: '14px',
    marginBottom: '5px',
    },
    description: {
      color: 'white',
      fontSize: '12px',
      opacity: 0.7,
    },
  }}

          minLength={props.row.min}
          maxLength={props.row.max}
          disabled={props.row.disabled}
          withAsterisk={props.row.required}
        />
      ) : (
        <PasswordInput
          {...props.register}
          defaultValue={props.row.default}
          label={props.row.label}
          description={props.row.description}
          icon={props.row.icon && <LibIcon icon={props.row.icon} fixedWidth />}
          placeholder={props.row.placeholder}
          styles={{
            input: {
            background: 'rgba(0, 30, 255, 0.12)',
            border: '0.5px solid #2980b9',
            backgroundImage: 'url(/src/blur.png)',
            backgroundRepeat: 'repeat',
            backgroundSize: 'auto',
            backgroundPosition: 'center',
            backgroundBlendMode: 'overlay',
            color: '#ffffff',
                '::placeholder': {
                  color: '#ffffff',
            },
          },
            label: {
              color: 'white',
            },
            description: {
              color: '#ffffff',
            },
            icon: {
              color: '#ffffff',
            },
          }}
          minLength={props.row.min}
          maxLength={props.row.max}
          disabled={props.row.disabled}
          withAsterisk={props.row.required}
          visibilityToggleIcon={({ reveal, size }) => (
            <LibIcon
              icon={reveal ? 'eye-slash' : 'eye'}
              fontSize={size}
              cursor="pointer"
              className={classes.eyeIcon}
              fixedWidth
            />
          )}
        />
      )}
    </>
  );
};

export default InputField;