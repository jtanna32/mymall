// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mymall/bloc/local_pet_bloc/local_pet_bloc.dart';
import 'package:mymall/utils/database_utils/hive_data_store.dart';
import 'package:mymall/utils/ui_utils.dart';
import 'package:mymall/view/add_pet_details.dart';

class MyPetPage extends StatefulWidget {
  const MyPetPage({Key? key}) : super(key: key);

  @override
  _MyPetPageState createState() => _MyPetPageState();
}

class _MyPetPageState extends State<MyPetPage> {
  int total = 0;

  @override
  void initState() {
    super.initState();

    context.read<LocalPetBloc>().add(GetAllPetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var value = HiveDataStore.box;
          print(value.listenable().value);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPetDetails(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
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
      child: BlocListener<LocalPetBloc, LocalPetState>(
        listener: (context, state) {
          if (state is GetAllPetSuccessState) {
            UiUtils.showSnackbar(context, "Pet Added Successfully");
          }
        },
        child: BlocBuilder<LocalPetBloc, LocalPetState>(
          builder: (context, state) {
            if (state is GetAllPetLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NoPetState) {
              return Center(
                child: Text("No pet available"),
              );
            } else if (state is GetAllPetSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: state.pets?.length,
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
                                        child:
                                            state.pets?[index].featuredImage !=
                                                    null
                                                ? Image.network(
                                                    state.pets![index]
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
                                              state.pets?[index].title ?? "",
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
                                                    "\$${state.pets?[index].price}")
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
                                      context.read<LocalPetBloc>().add(
                                          DeletePetEvent(
                                              id: state.pets![index].id!));
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
                          "Total items: ${state.pets!.length}",
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
