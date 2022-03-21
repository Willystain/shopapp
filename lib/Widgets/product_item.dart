import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/product_provider.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            //usou a rota e envio o argumento
            Navigator.of(context).pushNamed(ProductDetailScreen.routename,
                arguments: productsData.id);
          },
          child: Image.network(
            productsData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(productsData.isFavorite
                ? Icons.favorite
                : Icons.favorite_border_outlined),
            onPressed: () {
              setState(() {
                productsData.toggleFavoriteStatus();
              });
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
          title: Text(
            productsData.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
