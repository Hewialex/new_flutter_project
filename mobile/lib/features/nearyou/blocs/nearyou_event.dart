part of 'nearyou_bloc.dart';

sealed class NearyouEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NearYouLoad extends NearyouEvent {
  final int page;

  NearYouLoad({this.page = 0});
  @override
  List<Object> get props => [page];
}

class NearYouLoadMore extends NearyouEvent {
  NearYouLoadMore();

  @override
  List<Object> get props => [];
}
