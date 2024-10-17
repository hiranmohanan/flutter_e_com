part of 'productdetail_bloc.dart';

@immutable
abstract class ProductdetailEvent {}

class ProductDetailCallEvent extends ProductdetailEvent {
  final FireRdbData product;

  ProductDetailCallEvent({required this.product});
}