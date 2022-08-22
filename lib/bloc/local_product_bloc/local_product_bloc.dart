import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mymall/model/product.dart';
import 'package:mymall/source/local/product_local_repository.dart';

part 'local_product_event.dart';

part 'local_product_state.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  final ProductLocalRepository localRepository;

  LocalProductBloc(this.localRepository) : super(LocalProductInitial()) {
    // add product to cart
    on<AddProductToCartEvent>((event, emit) async {
      var products = await localRepository.getAllProducts();
      if (products != null) {
        final filteredProducts = products
            .where((element) => element.id == event.productData!.id)
            .toList();
        if (filteredProducts.isEmpty) {
          addProductToCart(event.productData!);
        } else {
          emit(ProductAlreadyInCartState(message: "Product Already added"));
        }
      } else {
        addProductToCart(event.productData!);
      }
    });
    // call this event to reset to initial state
    on<GetToInitialEvent>((event, emit) => emit(LocalProductInitial()));
    on<GetAllCartProductEvent>((event, emit) async {
      emit(GetAllCartProductLoadingState());
      final products = await localRepository.getAllProducts();
      if(products.isEmpty) {
        emit(NoProductInCardState(message: "No Products available"));
      } else {
        emit(GetAllCartProductSuccessState(products: products));
      }
    });
    // delete product from cart
    on<DeleteCartProductEvent>((event, emit) async {
      emit(DeleteProductLoadingState());
      final result = await localRepository.deleteProductById(event.id);
      if(result != null) {
        emit(DeleteProductSuccessState());
      } else {
        emit(DeleteProductFailureState(error: "Something went wrong"));
      }
    });
  }

  void addProductToCart(ProductData productData) async {
    var result = await localRepository.createProduct(productData);
    if (result != null) {
      emit(AddProductToCartSuccessState());
    } else {
      emit(AddProductToCartFailureState(error: "Something went wrong"));
    }
  }
}
