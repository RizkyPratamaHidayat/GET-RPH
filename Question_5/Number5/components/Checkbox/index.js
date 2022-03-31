import React, {useState, useContext} from 'react';
import PropTypes from 'prop-types';
import {TouchableOpacity, Image, View, Text} from 'react-native';
import {useDidUpdateEffect} from '../../helpers/hooks';
import styles from './styles';

const Checkbox = (props) => {
  const {
    checkboxStyle,
    value,
    onCheckChange,
    label,
    rootStyle,
    renderLabel,
    labelStyle,
  } = props;
  const [checked, setChecked] = useState(value);
  // handle check change

  useDidUpdateEffect(() => {
    onCheckChange(checked);
  }, [checked]);

  const renderInner = () => {
    if (value || checked) {
      return (
        <Image
          style={[styles.checkedImage]}
          source={require('../../assets/png/checked.png')}
        />
      );
    }
    return null;
  };

  return (
    <View style={[styles.root, rootStyle]}>
      <TouchableOpacity
        {...props}
        onPress={() => {
          setChecked(!checked);
        }}
        style={[checkboxStyle, styles.checkboxContainer]}>
        {renderInner()}
      </TouchableOpacity>
      <View style={styles.textContainer}>
        {renderLabel ? (
          renderLabel()
        ) : (
          <Text style={[styles.createCheckLabel, labelStyle]}>{label}</Text>
        )}
      </View>
    </View>
  );
};

Checkbox.propTypes = {
  label: PropTypes.string,
  items: PropTypes.array,
  inputLabelStyle: PropTypes.object,
  zIndexValue: PropTypes.number,
  value: PropTypes.any,
  onCheckChange: PropTypes.func,
  rootStyle: PropTypes.object,
  renderLabel: PropTypes.any,
  labelStyle: PropTypes.object,
};

Checkbox.defaultProps = {
  label: '',
  items: [],
  inputLabelStyle: {},
  zIndexValue: 0,
  value: null,
  onCheckChange: () => {},
  rootStyle: {},
  renderLabel: null,
  labelStyle: {},
};

export default Checkbox;
