import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/models/ffirebase/models.dart';
import 'package:flutter_e_com/service/firebase_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductCallEvent>(getProdductsAll);
  }

  Future<void> getProdductsAll(ProductCallEvent event, Emitter emit) async {
    emit(ProductLoading());
    try {
      final products = await FireRDbService().getData();
      emit(ProductLoaded(products));
    debugPrint('getProdductsAll');
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
