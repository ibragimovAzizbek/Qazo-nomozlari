import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonomozlar/views/onBording/state/on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingInitial());

  changeState(state) {
    emit(state);
  }
}
