import 'package:flutter/material.dart';
import 'package:ponyville/models/product.dart';


class DetailProductPage extends StatelessWidget {
    final Product product;

    const DetailProductPage({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(product.fields.name),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            product.fields.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20),
                        Text('Amount: ${product.fields.price}'),
                        SizedBox(height: 20),
                        Text('Description: ${product.fields.description}'),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
            ),
        );
    }
}
