/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import { NewAppScreen } from '@react-native/new-app-screen';
import {
  StatusBar,
  StyleSheet,
  useColorScheme,
  TouchableOpacity,
  Text,
} from 'react-native';
import {
  SafeAreaProvider,
  useSafeAreaInsets,
} from 'react-native-safe-area-context';
import NativeLocalModel from './specs/NativeLocalModel';
import { useState } from 'react';

function App() {
  const isDarkMode = useColorScheme() === 'dark';
  const [text, setText] = useState('');

  return (
    <SafeAreaProvider>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <TouchableOpacity
        style={{ backgroundColor: 'blue', padding: 30 }}
        onPress={async () => {
          setText(
            await NativeLocalModel.ask(
              'Which places to visit in India? Reply only with places name',
            ),
          );
        }}
      >
        <Text style={{ color: 'white' }}>Ask Foundation Model</Text>
      </TouchableOpacity>
      <Text style={{ fontSize: 30, color: 'red' }}>{text}</Text>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

export default App;
