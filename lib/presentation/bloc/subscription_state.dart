abstract class PremiumState {}

class PremiumInitialState extends PremiumState {}

class PremiumLoadingState extends PremiumState {}

class PremiumSuccessState extends PremiumState {
  final int newBalance;

  PremiumSuccessState(this.newBalance);
}

class PremiumErrorState extends PremiumState {
  final String error;

  PremiumErrorState(this.error);
}
