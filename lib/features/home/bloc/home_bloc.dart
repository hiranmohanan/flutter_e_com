import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialPage>((event, emit) {
      initPages(event, emit);
    });
    on<HomePageChange>((event, emit) {
      changePage(event, emit);
    });
  }

  Future<void> initPages(HomeInitialPage event, Emitter emit) async {
    emit(HomePageState(0));
  }

  Future<void> changePage(HomePageChange event, Emitter emit) async {
    emit(HomePageState(event.index));
  }
}
