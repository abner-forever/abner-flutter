import 'action.dart';
import 'state.dart';

//reducer
CountState reducer(CountState state, action) {
  //匹配Action
  if (action == ACTION.Increment) {
    return CountState(state.count + 1);
  }
  if (action == ACTION.Subtract) {
    return CountState(state.count - 1);
  }

  return state;
}
