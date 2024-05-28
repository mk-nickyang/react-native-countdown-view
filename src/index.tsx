import {
  requireNativeComponent,
  UIManager,
  Platform,
  type ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-countdown-view' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type CountdownViewProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'CountdownViewView';

export const CountdownViewView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<CountdownViewProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
