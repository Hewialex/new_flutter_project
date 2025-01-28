import 'package:test_app/presentation/bloc/subscription_event.dart';
import 'package:test_app/presentation/bloc/subscription_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(InitialState()) {
    on<SubscribeEvent>((event, emit) async {
      // Simulate a delay for a better UI experience (like loading)
      await Future.delayed(Duration(seconds: 1));
      emit(SubscribedState()); // Emit Subscribed state
    });
  }
}