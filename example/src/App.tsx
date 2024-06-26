import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { CountdownView } from 'react-native-countdown-view';

export default function App() {
  return (
    <View style={styles.container}>
      <CountdownView
        countdownTime={10}
        style={{
          width: 200,
          height: 200,
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
