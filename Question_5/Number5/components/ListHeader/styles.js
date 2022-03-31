import {Platform, StyleSheet} from 'react-native';
import {wp} from '../../helpers/responsive';

const styles = StyleSheet.create({
  selectAllContainer:{
    flexDirection: 'row',
    justifyContent: 'space-between',
    margin:wp(10)
},
btndelete:{
    backgroundColor : 'red',
    padding: wp(5),
    paddingHorizontal: wp(10),
    borderRadius: wp(20),
},
labelDelete:{ 
    color: 'white'
}
  });
export default styles;
