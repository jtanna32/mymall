part of 'local_product_bloc.dart';

abstract class LocalProductEvent {
  const LocalProductEvent();
}

class AddProductToCartEvent extends LocalProductEvent {
  ProductData? productData;

  AddProductToCartEvent({this.productData});
}

class GetToInitialEvent extends LocalProductEvent {}

class GetAllCartProductEvent extends LocalProductEvent {}

class DeleteCartProductEvent extends LocalProductEvent {
  final int id;

  DeleteCartProductEvent({required this.id});
}
