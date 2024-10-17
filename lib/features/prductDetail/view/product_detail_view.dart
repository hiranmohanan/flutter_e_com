import 'package:flutter/material.dart';
import 'package:flutter_e_com/models/ffirebase/models.dart';
import 'package:flutter_e_com/widegts/widgets.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final FireRdbData product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name!),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            height: MediaQuery.sizeOf(context).height * 0.5,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              image: DecorationImage(
                  image: NetworkImage(product.image!), fit: BoxFit.cover),
              backgroundBlendMode: BlendMode.darken,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          )),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(product.name!),
                ),
                ListTile(
                  title: const Text('Price: \$100'),
                  subtitle: Text("\$${product.price!}"),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: cartButton(context, [product], 0),
          )
        ],
      ),
    );
  }
}
