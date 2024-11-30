import 'package:flutter/material.dart';

class BaseViewModel<State> extends ChangeNotifier {
  BaseViewModel(State initState) {
    _state = initState;
  }

  late State _state;
  State get state => _state;

  bool _initialised = false;
  bool get initialised => _initialised;

  bool _disposed = false;
  bool get disposed => _disposed;

  set setState(State state) {
    if (!_disposed) {
      _state = state;
      notifyListeners();
    }
  }

  set setInitialized(bool value) {
    _initialised = value;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
