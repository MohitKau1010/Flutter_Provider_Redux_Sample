import 'package:welcomeflutter/screens/state_mang/redux/state/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/AppState.dart';
RAppState reducer(RAppState prevState, dynamic action) {
  RAppState newState = RAppState.fromAppState(prevState);
  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }
  return newState;
}