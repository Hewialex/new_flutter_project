import 'package:bloc/bloc.dart';
import 'package:test_app/presentation/bloc/subscription_event.dart';
import 'package:test_app/presentation/bloc/subscription_state.dart';
import 'package:test_app/presentation/screens/dummy_data.dart';

class PremiumBloc extends Bloc<PremiumEvent, PremiumState> {
  final DummyData dummyData;

  PremiumBloc(this.dummyData) : super(PremiumInitialState());

  @override
  Stream<PremiumState> mapEventToState(PremiumEvent event) async* {
    if (event is SubscribeEvent) {
      yield PremiumLoadingState();  // Start by showing a loading state

      try {
        // Call the subscribe method. It doesn't return anything, but updates the balance.
        await dummyData.subscribe(event.userId);

        // Once the subscription is successful, update the state with the new balance
        yield PremiumSuccessState(dummyData.users[0].balance);
      } catch (e) {
        // If an error occurs (e.g., insufficient balance), show an error state
        yield PremiumErrorState(e.toString());
      }
    }
  }
}
