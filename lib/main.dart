import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/products_provider.dart';
import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProductData(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsOverviewScreen(),
        //registrou a rota
        routes: {
          ProductDetailScreen.routename: (context) => ProductDetailScreen()
        },
      ),
    );
  }
}
