import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/core/error/exception.dart';
import 'package:qismati/core/network/network_info.dart';
import 'package:qismati/core/utils/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/features/nearyou/data/nearyou_data.dart';

part 'nearyou_event.dart';
part 'nearyou_state.dart';

class NearYouBloc extends Bloc<NearyouEvent, NearYouState> {
  NearYouBloc() : super(NearYouInitial()) {
    on<NearYouLoad>(_loadNearYou);
    on<NearYouLoadMore>(_loadMoreNearYou);
  }

  final NearYouDataProvier _nearYouDataProvier = NearYouDataProvier();

  FutureOr<void> _loadNearYou(
      NearYouLoad event, Emitter<NearYouState> emit) async {
    try {
      emit(NearYouLoading());

      debugPrint("Event : NearYouLoad");
      var location = LocationImpl(Geolocator());
      var currLocation = await location.getLocation();

      debugPrint(currLocation.toString());

      final List<ProfileModel> people = await _nearYouDataProvier.getNearYou(
        page: event.page,
      );
      emit(NearYouLoaded(people: people, page: event.page));
    } on Exception catch (e) {
      emit(NearYouError(message: mapErrorToMessage(e)));
    }
  }

  FutureOr<void> _loadMoreNearYou(event, emit) async {
    try {
      debugPrint("Load More ...");

      if (state is NearYouLoading) return;

      if (state is NearYouError) {
        await _loadNearYou(event, emit);
        return;
      }

      final currState = state as NearYouLoaded;
      debugPrint("Event : NearYouLoadMore ${currState.page}");

      final nextPage = currState.page + 1;

      final networkInfo =
          await NetworkInfoImpl(InternetConnectionChecker()).isConnected;

      if (!networkInfo) {
        throw NetworkException();
      }

      emit(NearYouLoading(people: currState.people));

      final List<ProfileModel> people =
          await _nearYouDataProvier.getNearYou(page: nextPage);

      final List<ProfileModel> updatedPeople = List.from(currState.people)
        ..addAll(people);
      emit(NearYouLoaded(people: updatedPeople, page: nextPage));
    } catch (e) {
      emit(NearYouError(message: e.toString()));
    }
  }

  // error to message mapping
  String mapErrorToMessage(
    Exception exception,
  ) {
    switch (exception.runtimeType) {
      case NetworkException _:
        return "Network error";
      case ServerException  _:
        return "Server error";
      default:
        return exception.toString();
    }
  }
}
