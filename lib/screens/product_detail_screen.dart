import 'package:flutter/material.dart';
import '../models/products_provider.dart';
import './products_overview_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  //criou a rota
  static const routename = '/product-detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    //extrai o argumento da rota
    final productId = ModalRoute.of(context).settings.arguments as String;
    /* multiline    

    -- PONTO 1
    pq o Provider?? pq agora podemos procurar dentro do objeto qualquer atributo.
    */

    final productsData = Provider.of<ProductData>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          productsData.title,
        ),
      ),
      body: Column(
        children: [
          Text('Esse item é favorito?'),
          (productsData.isFavorite
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border_outlined)),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  productsData.toggleFavoriteStatus();
                });
              },
              child: Text('apertas'))
        ],
      ),
    );
  }
}
