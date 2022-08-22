import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymall/bloc/local_product_bloc/local_product_bloc.dart';
import 'package:mymall/bloc/product_bloc/product_bloc.dart';
import 'package:mymall/bloc/product_bloc/product_event.dart';
import 'package:mymall/source/local/product_local_repository_impl.dart';
import 'package:mymall/source/remote/product_repository_impl.dart';
import 'package:mymall/view/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(ProductRepositoryImpl())),
        BlocProvider(create: (context) => LocalProductBloc(ProductLocalRepositoryImpl()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PrdouctPage(),
      ),
    );
  }
}
