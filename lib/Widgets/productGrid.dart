import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/product_item.dart';
import 'package:flutter_complete_guide/models/product_provider.dart';
import 'package:provider/provider.dart';

import '../models/products_provider.dart';

class ProductGrid extends StatelessWidget {
  final bool switcher;
  ProductGrid(this.switcher);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductData>(context);
    final produtos = switcher ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produtos.length,
      //temos q criar um provider notifier para cada item,
      //USAR ChangeNotifierProvider>>>>>.value <<<<< quando for lista
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: produtos[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 10,
      ),
    );
  }
}
