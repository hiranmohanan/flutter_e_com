part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<FireRdbData> products;

  WishlistLoaded(this.products);
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);
}
