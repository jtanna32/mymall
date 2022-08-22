part of 'local_product_bloc.dart';

abstract class LocalProductState {
  const LocalProductState();
}

class LocalProductInitial extends LocalProductState {
  @override
  List<Object> get props => [];
}

class AddProductToCartSuccessState extends LocalProductState {}

class AddProductToCartLoadingState extends LocalProductState {}

class AddProductToCartFailureState extends LocalProductState {
  String? error;

  AddProductToCartFailureState({this.error});
}

class ProductAlreadyInCartState extends LocalProductState {
  String? message;

  ProductAlreadyInCartState({this.message});
}

class GetAllCartProductSuccessState extends LocalProductState {
  List<ProductData>? products;

  GetAllCartProductSuccessState({this.products});

  @override
  List<Object?> get props => [products];
}

class GetAllCartProductLoadingState extends LocalProductState {}

class NoProductInCardState extends LocalProductState {
  String? message;

  NoProductInCardState({this.message});
}

class DeleteProductSuccessState extends LocalProductState {}

class DeleteProductLoadingState extends LocalProductState {}

class DeleteProductFailureState extends LocalProductState {
  String? error;

  DeleteProductFailureState({this.error});
}
