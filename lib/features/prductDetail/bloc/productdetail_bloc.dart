import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/models/ffirebase/models.dart';
import 'package:flutter_e_com/service/firebase_service.dart';



part 'productdetail_event.dart';
part 'productdetail_state.dart';

class ProductdetailBloc extends Bloc<ProductdetailEvent, ProductdetailState> {
  ProductdetailBloc() : super(ProductdetailInitial()){
    on<ProductDetailCallEvent>(fetchProductDetail);
  }

  Future<void> fetchProductDetail(ProductDetailCallEvent event,Emitter emit) async {
    try {
      emit(ProductDetailLoading());
      final responce=await FireRDbService().getData(key: event.product.id);
      emit(ProductDetailLoaded(product: responce.first));
    } catch (e) {
      emit(ProductDetailError(message: e.toString()));
    }
  }


}
