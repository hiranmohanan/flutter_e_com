import 'package:flutter/material.dart';
import 'package:flutter_e_com/models/ffirebase/models.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final FireRdbData product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Product 1'),
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
              image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  fit: BoxFit.cover),
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
                const ListTile(
                  title: Text('Product 1'),
                  subtitle: Text('Description'),
                ),
                const ListTile(
                  title: Text('Price: \$100'),
                ),
                const ListTile(
                  title: Text('Add to cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
