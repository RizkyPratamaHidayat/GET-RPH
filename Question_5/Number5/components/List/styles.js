import {Platform, StyleSheet} from 'react-native';
import {wp} from '../../helpers/responsive';

const styles = StyleSheet.create({
    root:{
      backgroundColor: 'aqua',
      flexDirection: 'row',
      borderBottomWidth: 1,
      borderColor: 'white',
      padding: wp(10),
      justifyContent: 'space-between'
    },
    titleLbl:{
      width: wp(250)
    },
    titleContainer:{
      flexDirection: 'row',
    },
    editContainer:{
      backgroundColor: 'orange',
      padding: wp(5)
    }
  });
export default styles;
