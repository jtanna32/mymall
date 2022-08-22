import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymall/bloc/product_bloc/product_event.dart';
import 'package:mymall/bloc/product_bloc/product_state.dart';
import 'package:mymall/model/product.dart';
import 'package:mymall/source/remote/product_repository.dart';
import 'package:mymall/source/remote/product_repository_impl.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  ProductRepository? repository;
  ScrollController? controller = ScrollController();
  Product? product;

  ProductBloc() : super(GetProductInitialState()) {
    on<GetProductEvent>((event, emit) async {
      repository = ProductRepositoryImpl();
      // emit loading state if state is loading
      emit(ProductLoadingState());
      try {
        product = await repository!.getProducts(event.page!);
        // emit success state if state is loading
        emit(GetProductSuccessState(product: product));
      } on Exception {
        // emit failure state if state is loading
        emit(ProductFailureState(error: "Something went wrong"));
      }
    });
  }
}
