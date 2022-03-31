import {Platform, StyleSheet} from 'react-native';
import {wp} from '../../helpers/responsive';

const styles = StyleSheet.create({
    checkboxContainer: {
      borderWidth: 0.5,
      width: wp(20),
      height: wp(20),
      borderRadius: wp(7),
      borderColor: 'green',
    },
    checkedImage: {
      resizeMode: 'stretch',
      width: '100%',
      height: '100%',
    },
    appendZindex: {
      zIndex: 10,
    },
    handleAbsolute: {
      position: 'absolute',
    },
    extraZindex: {
      zIndex: Platform.OS === 'ios' ? 11 : undefined,
    },
    labelZindex: {
      zIndex: Platform.OS === 'ios' ? 12 : undefined,
    },
    root: {
      flexDirection: 'row',
      alignItems: 'center',
    },
    createCheckLabel: {
      fontSize: wp(10),
      color: 'black',
      
      marginLeft: wp(10),
      flexShrink: 1,
      lineHeight: wp(18),
    },
    textContainer: {
      flexDirection: 'row',
    },
    btnAdd:{
      position:'absolute',
      backgroundColor: 'orange',
      top: wp(30),
      right: wp(50),
      zIndex: wp(100),
      padding: wp(20),
      paddingVertical: wp(15),
      borderRadius: wp(50)
    },
    labelAdd:{
      fontSize: wp(17)
    }
  });
export default styles;
