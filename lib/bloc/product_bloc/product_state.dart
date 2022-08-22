import 'package:flutter/material.dart';
import 'package:mymall/model/product.dart';

@immutable
abstract class ProductBlocState{
  Product? product;
}

class GetProductInitialState extends ProductBlocState{}

class GetProductSuccessState extends ProductBlocState {
  Product? product;
  GetProductSuccessState({this.product});

  @override
  List<Object?> get props => [product];
}

class ProductLoadingState extends ProductBlocState {}

class ProductFailureState extends ProductBlocState {
  String? error;
  ProductFailureState({this.error});
}

