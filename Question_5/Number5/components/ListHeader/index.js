import { StatusBar } from "expo-status-bar";
import { TouchableOpacity, Text, View } from "react-native";
import CheckBox from "../Checkbox";
import styles from "./styles";
function ListHeader(props) {
  const { handleDeleteAll, setValueCheck, valueCheck } = props;

  return (
    <View style={styles.selectAllContainer}>
      <CheckBox
        onCheckChange={(ev) => setValueCheck(ev)}
        checked={valueCheck}
      />
      {valueCheck && (
        <TouchableOpacity
          style={styles.btndelete}
          onPress={() => handleDeleteAll()}
        >
          <Text style={styles.labelDelete}>X</Text>
        </TouchableOpacity>
      )}
    </View>
  );
}
export default ListHeader;
