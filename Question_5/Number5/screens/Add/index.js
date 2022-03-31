import { StatusBar } from "expo-status-bar";
import { Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import { useState } from "react";
function Add(props) {
  const { setTitle, title, handeAdd, handleEdit, type, selectedData } = props;
  return (
    <View style={styles.root}>
      <TextInput
        onChangeText={(ev) => setTitle(ev)}
        style={styles.input}
        placeholder="title..."
        value={type === 'edit' && !title ?  selectedData?.title : title}
      />
      <TouchableOpacity
        onPress={() => {
          if (type === "edit") {
            handleEdit();
          } else {
            handeAdd();
          }
        }}
        style={styles.btnAdd}
      >
        <Text style={styles.labelAdd}>{type}</Text>
      </TouchableOpacity>
    </View>
  );
}
export default Add;
