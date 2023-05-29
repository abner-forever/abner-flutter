// import 'package:meta/meta.dart';

// State中所有属性都应该是只读的
@override
// ignore: must_be_immutable
class CountState {
  int _count = 0;
  get count => _count;
  CountState(this._count);
  CountState.initState() {
    _count = 0;
  }
}
