part of 'productdetail_bloc.dart';

@immutable
abstract class ProductdetailState {}

class ProductdetailInitial extends ProductdetailState {}

class ProductDetailLoading extends ProductdetailState {}

class ProductDetailLoaded extends ProductdetailState {
  final FireRdbData product;

  ProductDetailLoaded({required this.product});
}

class ProductDetailError extends ProductdetailState {
  final String message;

  ProductDetailError({required this.message});
}
