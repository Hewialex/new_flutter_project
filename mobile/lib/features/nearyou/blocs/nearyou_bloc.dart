import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qismati/core/error/exception.dart';
import 'package:qismati/core/network/network_info.dart';
import 'package:qismati/core/utils/location.dart';
import 'package:qismati/features/home/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

part 'nearyou_event.dart';
part 'nearyou_state.dart';

final List<People> people = [
  People(
    name: "Fatima",
    image: "assets/images/female_avatar.png",
    locationName: "Saudi",
    isPremium: false,
  ),
  People(
    name: "Alisha",
    image: "assets/images/female_avatar.png",
    locationName: "Pakistan",
    isPremium: true,
  ),
  People(
    name: "Luluwa",
    image: "assets/images/female_avatar.png",
    locationName: "Dubai",
    isPremium: true,
  ),
  People(
    name: "Ekram",
    image: "assets/images/female_avatar.png",
    locationName: "Dubai",
    isPremium: false,
  ),
];

class NearYouBloc extends Bloc<NearyouEvent, NearYouState> {
  NearYouBloc() : super(NearYouInitial()) {
    on<NearYouLoad>(_loadNearYou);
    on<NearYouLoadMore>(_loadMoreNearYou);
    on<NearYouRefresh>(_loadNearYouRefresh);
  }

  FutureOr<void> _loadNearYou(event, emit) async {
    try {
      debugPrint("Event : NearYouLoad");
      var location = LocationImpl(Geolocator());
      var currLocation = await location.getLocation();

      debugPrint(currLocation.toString());
      emit(NearYouLoading());

      final networkInfo =
          await NetworkInfoImpl(InternetConnectionChecker()).isConnected;

      if (!networkInfo) {
        throw NetworkException();
      }

      // const baseUrl =
      //     "https://dating-backend-sf1t.onrender.com/api/v1/user/nearme";

      // final response = await http.get(
      //   Uri.parse(
      //     "$baseUrl?latitude=${currLocation.latitude}&longitude=${currLocation.longitude}&distance=100",
      //   ),
      // );

      // debugPrint(response.body);

      await Future.delayed(const Duration(seconds: 2));

      emit(NearYouLoaded(people: people, page: 1));
    } on Exception catch (e) {
      emit(NearYouError(message: mapErrorToMessage(e)));
    } catch (e) {
      emit(NearYouError(message: e.toString()));
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

      await Future.delayed(const Duration(seconds: 3));

      final List<People> updatedPeople = List.from(currState.people)
        ..addAll(people);
      emit(NearYouLoaded(people: updatedPeople, page: nextPage));
    } catch (e) {
      emit(NearYouError(message: e.toString()));
    }
  }

  FutureOr<void> _loadNearYouRefresh(event, emit) async {
    try {
      emit(NearYouLoading());

      await Future.delayed(const Duration(seconds: 2));

      emit(NearYouLoaded(people: people, page: 1));
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
      default:
        return "Unknown error";
    }
  }
}
