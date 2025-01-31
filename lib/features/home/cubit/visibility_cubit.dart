import 'package:bloc/bloc.dart';

class VisibilityState {
  final bool firstVisible;
  final bool secondVisible;

  VisibilityState({
    this.firstVisible = true,
    this.secondVisible = false,
  });

  VisibilityState copyWith({
    bool? firstVisible,
    bool? secondVisible,
  }) {
    return VisibilityState(
      firstVisible: firstVisible ?? this.firstVisible,
      secondVisible: secondVisible ?? this.secondVisible,
    );
  }
}

class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(VisibilityState());

  void toggleVisibility() {
    emit(state.copyWith(
      firstVisible: !state.firstVisible,
      secondVisible: !state.secondVisible,
    ));
  }
}
