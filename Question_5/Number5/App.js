import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import Home from "./screens/Home";
import mockData from "./mock.json";
import { useState } from "react";
import { useDidUpdateEffect } from "./helpers/hooks";
import Add from "./screens/Add";
import styles from "./components/Checkbox/styles";
export default function App() {
  const [data, setData] = useState(mockData);
  const [selectedData, setSelectedData] = useState();
  const [type, setType] = useState("list");
  const [title, setTitle] = useState("");

  const handleDeleteAll = () => {
    setData([]);
  };
  const handeAdd = () => {
    const params = {
      id: data.length + 1,
      title,
    };
    setData([params, ...data]);
    setType("list");
    setTitle("");
  };
  const handleEdit = () => {
    const response = data.map((item) => {
      if (item.id === selectedData.id) {
        return {
          title: title,
        };
      }
      return item;
    });
    console.log('123 : ', response)
    setData(response)
    setType("list");
    setTitle("");
  };
  if (type === "add" || type === "edit") {
    return <Add title={title} selectedData={selectedData} handleEdit={handleEdit} type={type} handeAdd={handeAdd} setTitle={setTitle} />;
  }
  return (
    <>
      <TouchableOpacity onPress={() => setType("add")} style={styles.btnAdd}>
        <Text style={styles.labelAdd}>+</Text>
      </TouchableOpacity>
      <Home
        setType={setType}
        handleDeleteAll={handleDeleteAll}
        data={data}
        setSelectedData={setSelectedData}
      />
    </>
  );
}
