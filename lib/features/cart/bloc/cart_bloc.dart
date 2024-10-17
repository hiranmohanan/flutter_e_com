import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/ffirebase/models.dart';
import '../../../service/firebase_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()){
    on<CartCallEvent>(getCartData);
  }

Future<void> getCartData(CartCallEvent event,Emitter emit) async{
    emit(CartLoading());
    try{
      final cartItems = await FireRDbService().getCart();
      emit(CartLoaded(cartItems));
      
    }catch(e){
      emit(CartError(e.toString()));
    }
}
}
