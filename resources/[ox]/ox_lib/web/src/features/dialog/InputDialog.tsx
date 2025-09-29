import { Button, Group, Modal, Stack } from '@mantine/core';
import React from 'react';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { useLocales } from '../../providers/LocaleProvider';
import { fetchNui } from '../../utils/fetchNui';
import type { InputProps } from '../../typings';
import { OptionValue } from '../../typings';
import InputField from './components/fields/input';
import CheckboxField from './components/fields/checkbox';
import SelectField from './components/fields/select';
import NumberField from './components/fields/number';
import SliderField from './components/fields/slider';
import { useFieldArray, useForm } from 'react-hook-form';
import ColorField from './components/fields/color';
import DateField from './components/fields/date';
import TextareaField from './components/fields/textarea';
import TimeField from './components/fields/time';
import dayjs from 'dayjs';

export type FormValues = {
  test: {
    value: any;
  }[];
};

const InputDialog: React.FC = () => {
  const [fields, setFields] = React.useState<InputProps>({
    heading: '',
    rows: [{ type: 'input', label: '' }],
  });
  const [visible, setVisible] = React.useState(false);
  const { locale } = useLocales();

  const form = useForm<{ test: { value: any }[] }>({});
  const fieldForm = useFieldArray({
    control: form.control,
    name: 'test',
  });

  useNuiEvent<InputProps>('openDialog', (data) => {
    setFields(data);
    setVisible(true);
    data.rows.forEach((row, index) => {
      fieldForm.insert(
        index,
        {
          value:
            row.type !== 'checkbox'
              ? row.type === 'date' || row.type === 'date-range' || row.type === 'time'
                ? // Set date to current one if default is set to true
                  row.default === true
                  ? new Date().getTime()
                  : Array.isArray(row.default)
                  ? row.default.map((date) => new Date(date).getTime())
                  : row.default && new Date(row.default).getTime()
                : row.default
              : row.checked,
        } || { value: null }
      );
      // Backwards compat with new Select data type
      if (row.type === 'select' || row.type === 'multi-select') {
        row.options = row.options.map((option) =>
          !option.label ? { ...option, label: option.value } : option
        ) as Array<OptionValue>;
      }
    });
  });

  useNuiEvent('closeInputDialog', async () => await handleClose(true));

  const handleClose = async (dontPost?: boolean) => {
    setVisible(false);
    await new Promise((resolve) => setTimeout(resolve, 200));
    form.reset();
    fieldForm.remove();
    if (dontPost) return;
    fetchNui('inputData');
  };

  const onSubmit = form.handleSubmit(async (data) => {
    setVisible(false);
    const values: any[] = [];
    for (let i = 0; i < fields.rows.length; i++) {
      const row = fields.rows[i];

      if ((row.type === 'date' || row.type === 'date-range') && row.returnString) {
        if (!data.test[i]) continue;
        data.test[i].value = dayjs(data.test[i].value).format(row.format || 'DD/MM/YYYY');
      }
    }
    Object.values(data.test).forEach((obj: { value: any }) => values.push(obj.value));
    await new Promise((resolve) => setTimeout(resolve, 200));
    form.reset();
    fieldForm.remove();
    fetchNui('inputData', values);
  });

  return (
    <>
      <Modal
        opened={visible}
        onClose={handleClose}
        centered
        closeOnEscape={fields.options?.allowCancel !== false}
        closeOnClickOutside={false}
        size="xs"
        styles={{
    title: {
      color: '#ffffff',
      fontSize: '22px',
      fontWeight: 500,
    },
    modal: {
  position: 'relative',

  background: 'rgba(0, 106, 255, 0.17)',
  boxShadow: `
      inset 3px 0 6px rgba(0,0,0,0.6),
      0 4px 10px rgba(0,0,0,0.4)
    `,
    border: '2px solid rgba(59, 181, 246, 0.36)',
    borderRadius: '10px',
    backgroundImage: 'url(/src/blur.png)',
    backgroundRepeat: 'repeat',
    backgroundSize: 'auto',
    backgroundPosition: 'center',
    backgroundBlendMode: 'overlay',
    padding: '20px',
  },
  }}
        title={fields.heading}
        withCloseButton={false}
        overlayOpacity={0.5}
        transition="fade"
        exitTransitionDuration={150}
      >
        <>
  {/* Top-Left */}
  <span style={{
    position: 'absolute',
    top: -3,
    left: -3,
    width: '25px',
    height: '25px',
    borderTop: '3px solid #29afb9',
    borderLeft: '3px solid #29afb9',
    borderTopLeftRadius: '10px',
  }} />
  
  {/* Top-Right */}
  <span style={{
    position: 'absolute',
    top: -3,
    right: -3,
    width: '25px',
    height: '25px',
    borderTop: '3px solid #29afb9',
    borderRight: '3px solid #29afb9',
    borderTopRightRadius: '10px',
  }} />

  {/* Bottom-Left */}
  <span style={{
    position: 'absolute',
    bottom: -3,
    left: -3,
    width: '25px',
    height: '25px',
    borderBottom: '3px solid #29afb9',
    borderLeft: '3px solid #29afb9',
    borderBottomLeftRadius: '10px',
  }} />

  {/* Bottom-Right */}
  <span style={{
    position: 'absolute',
    bottom: -3,
    right: -3,
    width: '25px',
    height: '25px',
    borderBottom: '3px solid #29afb9',
    borderRight: '3px solid #29afb9',
    borderBottomRightRadius: '10px',
    }} />
  </>
        <form onSubmit={onSubmit}>
          <Stack>
            {fieldForm.fields.map((item, index) => {
              const row = fields.rows[index];
              return (
                <React.Fragment key={item.id}>
                  {row.type === 'input' && (
                    <InputField
                      register={form.register(`test.${index}.value`, { required: row.required })}
                      row={row}
                      index={index}
                    />
                  )}
                  {row.type === 'checkbox' && (
                    <CheckboxField
                      register={form.register(`test.${index}.value`, { required: row.required })}
                      row={row}
                      index={index}
                    />
                  )}
                  {(row.type === 'select' || row.type === 'multi-select') && (
                    <SelectField row={row} index={index} control={form.control} />
                  )}
                  {row.type === 'number' && <NumberField control={form.control} row={row} index={index} />}
                  {row.type === 'slider' && <SliderField control={form.control} row={row} index={index} />}
                  {row.type === 'color' && <ColorField control={form.control} row={row} index={index} />}
                  {row.type === 'time' && <TimeField control={form.control} row={row} index={index} />}
                  {row.type === 'date' || row.type === 'date-range' ? (
                    <DateField control={form.control} row={row} index={index} />
                  ) : null}
                  {row.type === 'textarea' && (
                    <TextareaField
                      register={form.register(`test.${index}.value`, { required: row.required })}
                      row={row}
                      index={index}
                    />
                  )}
                </React.Fragment>
              );
            })}
            <Group position="right" spacing={10}>
  <Button
    uppercase
    variant="light"
    onClick={() => handleClose()}
    disabled={fields.options?.allowCancel === false}
    styles={{
      root: {
        backgroundColor: 'rgba(124, 18, 18, 0.33)',
        color: 'white',
        fontWeight: 600,
        padding: '12px 24px',
        borderRadius: '6px',
        border: '1px solid #971a1aa5',
        '&:hover': {
        backgroundColor: '#971a1aa5',
      },
    },
  }}
  >
  {locale.ui.cancel}
  </Button>
    <Button
      uppercase
      variant="light"
      type="submit"
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
        {locale.ui.confirm}
      </Button>
      </Group>
      </Stack>
      </form>
      </Modal>
    </>
  );
};

export default InputDialog;