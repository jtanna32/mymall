import 'package:flutter/material.dart';
import 'package:mymall/model/product.dart';

@immutable
abstract class ProductBlocEvent {}

class GetProductEvent extends ProductBlocEvent {
  int? page;

  GetProductEvent(this.page);
}

class ProductInitialEvent extends ProductBlocEvent {}

class AddLocalProductEvent extends ProductBlocEvent {
  ProductData? productData;

  AddLocalProductEvent({this.productData});
}

class GetLocalProductsEvent extends ProductBlocEvent {
  List<ProductData>? products;

  GetLocalProductsEvent({this.products});

  @override
  List<Object?> get props => [products];
}

class DeleteLocalProductEvent extends ProductBlocEvent {
  int? id;

  DeleteLocalProductEvent({this.id});
}
