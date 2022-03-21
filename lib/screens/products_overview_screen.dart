import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/productGrid.dart';
import '../models/product_provider.dart';
import '../Widgets/product_item.dart';

enum FilterOptions { Favorites, All }
var switcher = false;

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Myshop'),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOptions selectedOption) {
                  setState(() {
                    if (selectedOption == FilterOptions.Favorites) {
                      switcher = true;
                    } else {
                      switcher = false;
                    }
                  });
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      )
                    ])
          ],
        ),
        body: ProductGrid(switcher));
  }
}
