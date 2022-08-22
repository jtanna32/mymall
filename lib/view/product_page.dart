// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymall/bloc/local_product_bloc/local_product_bloc.dart';
import 'package:mymall/bloc/product_bloc/product_bloc.dart';
import 'package:mymall/bloc/product_bloc/product_event.dart';
import 'package:mymall/bloc/product_bloc/product_state.dart';
import 'package:mymall/utils/ui_utils.dart';
import 'package:mymall/view/my_cart_page.dart';

class PrdouctPage extends StatefulWidget {
  const PrdouctPage({Key? key}) : super(key: key);

  @override
  _PrdouctPageState createState() => _PrdouctPageState();
}

class _PrdouctPageState extends State<PrdouctPage> {
  int page = 1;
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent(page));
    context.read<ProductBloc>().controller?.addListener(() {
      loadMore();
    });
  }

  void loadMore() {
    if (context.read<ProductBloc>().controller!.position.pixels ==
        context.read<ProductBloc>().controller!.position.maxScrollExtent) {
      if (page < lastPage) {
        page = page + 1;
        context.read<ProductBloc>().add(GetProductEvent(page));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Shopping Mall"),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCartPage()));
                },
                child: Icon(Icons.shopping_cart_outlined)))
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: BlocListener<LocalProductBloc, LocalProductState>(
        listener: (context, state) {
          if (state is AddProductToCartSuccessState) {
            UiUtils.showSnackbar(context, "Product added successfully to cart");
          } else if (state is AddProductToCartFailureState) {
            UiUtils.showSnackbar(context, state.error ?? "");
          } else if (state is ProductAlreadyInCartState) {
            UiUtils.showSnackbar(context, state.message ?? "");
          }
        },
        child: BlocBuilder<ProductBloc, ProductBlocState>(
          builder: (context, state) {
            if (state is ProductFailureState) {
              return Center(
                child: Text(state.error ?? ""),
              );
            } else if (state is ProductLoadingState ||
                state is GetProductInitialState) {
              return Center(child: CircularProgressIndicator());
            } else {
              lastPage = state.product!.totalPage!;
              return GridView.builder(
                controller: context.read<ProductBloc>().controller,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.7 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: state.product!.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.blue,
                                child:
                                    state.product?.data?[index].featuredImage !=
                                            null
                                        ? Image.network(
                                            state.product!.data![index]
                                                .featuredImage!,
                                            fit: BoxFit.fill,
                                          )
                                        : SizedBox.shrink()),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 15, left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.product?.data?[index].title ?? "",
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 2,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      context.read<LocalProductBloc>().add(
                                          AddProductToCartEvent(
                                              productData:
                                                  state.product!.data![index]));
                                    },
                                    child: Icon(Icons.shopping_cart_outlined))
                              ],
                            ),
                          )
                        ],
                      ));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
