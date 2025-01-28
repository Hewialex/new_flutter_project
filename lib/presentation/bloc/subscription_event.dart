abstract class PremiumEvent {}

class SubscribeEvent extends PremiumEvent {
  final int userId;
  SubscribeEvent(this.userId);
}