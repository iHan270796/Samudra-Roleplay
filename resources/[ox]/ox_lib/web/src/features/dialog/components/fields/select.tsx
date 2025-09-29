import { MultiSelect, Select } from '@mantine/core';
import { ISelect } from '../../../../typings';
import { Control, useController } from 'react-hook-form';
import { FormValues } from '../../InputDialog';
import LibIcon from '../../../../components/LibIcon';

interface Props {
  row: ISelect;
  index: number;
  control: Control<FormValues>;
}

const SelectField: React.FC<Props> = (props) => {
  const controller = useController({
    name: `test.${props.index}.value`,
    control: props.control,
    rules: { required: props.row.required },
  });

  const value =
    props.row.type === 'multi-select'
      ? Array.isArray(controller.field.value)
        ? controller.field.value
        : []
      : typeof controller.field.value === 'string'
      ? controller.field.value
      : '';

  const data = props.row.options.map((opt) =>
    typeof opt === 'string' ? { value: opt, label: opt } : opt
  );

  return props.row.type === 'select' ? (
    <Select
      data={data}
      value={value as string}
      onChange={controller.field.onChange}
      onBlur={controller.field.onBlur}
      name={controller.field.name}
      ref={controller.field.ref}
      disabled={props.row.disabled}
      label={props.row.label}
      description={props.row.description}
      withAsterisk={props.row.required}
      clearable={props.row.clearable}
      searchable={props.row.searchable}
      icon={props.row.icon && <LibIcon icon={props.row.icon} fixedWidth />}
      styles={{
        input: {
          background: 'rgba(0, 30, 255, 0.12)',
          backgroundImage: 'url(/src/blur.png)',
          backgroundRepeat: 'repeat',
          backgroundSize: 'auto',
          backgroundPosition: 'center',
          backgroundBlendMode: 'overlay',
          border: '1px solid #2980b9',
          borderRadius: 8,
          color: 'white',
          fontWeight: 500,
          '::placeholder': { color: 'rgba(255, 255, 255, 0.72)' },
        },
        label: { color: 'white', fontWeight: 600, marginBottom: 5 },
        description: { color: 'white', fontSize: 13, marginBottom: 8 },
        dropdown: {
          background: 'rgba(0, 136, 255, 0.67)',
          backgroundImage: 'url(/src/blur.png)',
          backgroundRepeat: 'repeat',
          backgroundSize: 'auto',
          backgroundPosition: 'center',
          backgroundBlendMode: 'overlay',
          border: '1px solid #29b9b4ff',
          borderRadius: 4,
        },
        item: {
          color: 'white',
          backgroundColor: 'transparent',
          '&[data-hovered]': { backgroundColor: 'rgba(0, 42, 255, 0.7)' },
          '&[data-selected]': { backgroundColor: 'rgba(0, 42, 255, 0.7)' },
        },
      }}
    />
  ) : (
    <MultiSelect
      data={data}
      value={value as string[]}
      onChange={controller.field.onChange}
      onBlur={controller.field.onBlur}
      name={controller.field.name}
      ref={controller.field.ref}
      disabled={props.row.disabled}
      label={props.row.label}
      description={props.row.description}
      withAsterisk={props.row.required}
      clearable={props.row.clearable}
      searchable={props.row.searchable}
      maxSelectedValues={props.row.maxSelectedValues}
      icon={props.row.icon && <LibIcon icon={props.row.icon} fixedWidth />}
      styles={{
        input: {
          background: 'rgba(255, 255, 255, 0.3)',
          backgroundImage: 'url(/src/blur.png)',
          backgroundRepeat: 'repeat',
          backgroundSize: 'auto',
          backgroundPosition: 'center',
          backgroundBlendMode: 'overlay',
          border: '1px solid rgba(255, 255, 255, 0.2)',
          backdropFilter: 'blur(14px)',
          WebkitBackdropFilter: 'blur(14px)',
          borderRadius: 12,
          color: 'white',
          fontWeight: 500,
          '::placeholder': { color: 'rgba(255, 255, 255, 0.5)' },
        },
        label: { color: 'white', fontWeight: 600, marginBottom: 5 },
        description: { color: 'white', fontSize: 13, marginBottom: 8 },
        dropdown: {
          background: 'rgba(0, 136, 255, 0.67)',
          backgroundImage: 'url(/src/blur.png)',
          backgroundRepeat: 'repeat',
          backgroundSize: 'auto',
          backgroundPosition: 'center',
          backgroundBlendMode: 'overlay',
          border: '1px solid #29b9b4ff',
          borderRadius: 8,
        },
        item: {
          color: 'white',
          '&[data-selected]': { backgroundColor: 'rgba(0, 42, 255, 0.7)' },
          '&[data-hovered]': { backgroundColor: 'rgba(0, 42, 255, 0.7)' },
        },
      }}
    />
  );
};

export default SelectField;
