import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/ffirebase/models.dart';
import '../../../service/firebase_service.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistCallEvent>(getAllWishList);
  }

  Future<void> getAllWishList(WishlistCallEvent event, Emitter emit) async {
    emit(WishlistLoading());
    try {
      final products = await FireRDbService().getWishList();
      emit(WishlistLoaded(products));
      debugPrint('WishlistLoaded in bloc ${products.length}');
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }
}
