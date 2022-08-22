// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymall/bloc/local_product_bloc/local_product_bloc.dart';
import 'package:mymall/utils/ui_utils.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int total = 0;

  @override
  void initState() {
    super.initState();
    context.read<LocalProductBloc>().add(GetAllCartProductEvent());
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
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
      title: Text("My Cart"),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: BlocListener<LocalProductBloc, LocalProductState>(
        listener: (context, state) {
          if (state is DeleteProductSuccessState) {
            context.read<LocalProductBloc>().add(GetAllCartProductEvent());
          } else if (state is DeleteProductFailureState) {
            UiUtils.showSnackbar(context, state.error ?? "");
          } else if (state is GetAllCartProductSuccessState) {
            state.products!
                .forEach((element) => total = element.price! + total);
          }
        },
        child: BlocBuilder<LocalProductBloc, LocalProductState>(
          builder: (context, state) {
            if (state is GetAllCartProductLoadingState ||
                state is DeleteProductLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NoProductInCardState) {
              return Center(
                child: Text("No Product in cart"),
              );
            } else if (state is GetAllCartProductSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: state.products?.length,
                      cacheExtent: 1 / 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      child: Container(
                                        color: Colors.blue,
                                        height: 100,
                                        width: 100,
                                        child: state.products?[index]
                                                    .featuredImage !=
                                                null
                                            ? Image.network(
                                                state.products![index]
                                                    .featuredImage!,
                                                fit: BoxFit.fill)
                                            : SizedBox.shrink(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.products?[index].title ??
                                                  "",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Price"),
                                                Text(
                                                    "\$${state.products?[index].price}")
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: InkWell(
                                    onTap: () {
                                      total = 0;
                                      context.read<LocalProductBloc>().add(
                                          DeleteCartProductEvent(
                                              id: state.products![index].id!));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: double.infinity,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Container(
                    color: Colors.blue,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total items: ${state.products!.length}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "Grand total: $total",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
