import { StatusBar } from "expo-status-bar";
import { FlatList, Text, TouchableOpacity, View } from "react-native";
import CheckBox from "../../components/Checkbox";
import ListHeader from "../../components/ListHeader";
import styles from "./styles";
import { useState } from "react";

import List from "../../components/List";
function Home(props) {
  const { data, setSelectedData, setType, handleDeleteAll } = props;
  const [valueCheck, setValueCheck] = useState(false);
  const renderSliderItem = ({ item }) => {
    return (
      <List
        valueCheck={valueCheck}
        handleSelectedit={handleSelectedit}
        item={item}
      />
    );
  };
  const handleSelectedit = (ev, idx) => {
    setSelectedData(ev);
    setType('edit')
  };
  return (
    <View style={styles.root}>
      <FlatList
        ListHeaderComponent={
          <ListHeader
            valueCheck={valueCheck}
            setValueCheck={setValueCheck}
            handleDeleteAll={handleDeleteAll}
          />
        }
        data={data || []}
        renderItem={renderSliderItem}
        keyExtractor={(i, idx) => idx.toString()}
      />
    </View>
  );
}
export default Home;
