import { StatusBar } from "expo-status-bar";
import { FlatList, Text, TouchableOpacity, View } from "react-native";
import CheckBox from "../../components/Checkbox";
import styles from "./styles";
function List(props) {
  const { item, handleSelectedit, valueCheck } = props;

  return (
    <View style={styles.root}>
      <View style={styles.titleContainer}>
        {valueCheck && <CheckBox disabled value={valueCheck} />}
        <Text style={styles.titleLbl}>{item.title}</Text>
      </View>
      <TouchableOpacity style={styles.editContainer} onPress={() => handleSelectedit(item)}>
        <Text style={styles.editLbl}>Edit</Text>
      </TouchableOpacity>
    </View>
  );
}
export default List;
