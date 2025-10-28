import 'package:bloc/bloc.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(State initialState) : super(initialState);

  bool _initialised = false;
  bool get initialised => _initialised;

  bool _disposed = false;
  bool get disposed => _disposed;

  set setState(State state) {
    if (!_disposed) {
      emit(state);
    }
  }

  set setInitialized(bool value) {
    _initialised = value;
  }

  @override
  Future<void> close() {
    _disposed = true;
    return super.close();
  }
}
