import { Platform, StyleSheet } from "react-native";
import { wp } from "../../helpers/responsive";

const styles = StyleSheet.create({
  root: {
    marginVertical: wp(200),
    alignItems: "center",
  },
  input: {
    borderWidth: 1,
    width: "80%",
    padding: wp(10),
  },
  btnAdd: {
    backgroundColor: "orange",
    alignItems: "center",
    width: "80%",
    borderWidth: 1,
    margin: wp(10),
    padding: wp(20)
  },
  labelAdd: {
   fontSize: wp(24),
  },
});
export default styles;
