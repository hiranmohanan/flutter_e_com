import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/features/product/bloc/product_bloc.dart';
import 'package:flutter_e_com/service/firebase_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/ffirebase/models.dart';
import '../../prductDetail/view/product_detail_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductCallEvent());
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
      if (state is ProductLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProductError) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is ProductLoaded) {
        debugPrint('ProductLoaded');
        final snapshot = state.products;

        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 10),
          children: [
            SearchAnchor.bar(
              suggestionsBuilder: (context, controller) {
                return List.generate(snapshot.length, (index) {
                  return ListTile(
                    title: Text(snapshot[index].name!),
                    onTap: () {
                      controller.text = snapshot[index].name!;
                    },
                  );
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 200),
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: GridView.builder(
                  itemCount: snapshot.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.orientationOf(context) ==
                            Orientation.portrait
                        ? 2
                        : 3,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailView(
                              product: snapshot[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FittedBox(
                          child: Column(
                            children: [
                              Image.network(
                                snapshot[index].image!,
                                fit: BoxFit.fitWidth,
                              ),
                              Text(snapshot[index].name!),
                              Text(snapshot[index].price.toString()),
                            
                              Center(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      iconColor: Colors.white),
                                  onPressed: () {
                                    FireRDbService().addCart(
                                        data: FireRdbData(
                                            name: snapshot[index].name!,
                                            price: snapshot[index].price!,
                                            image: snapshot[index].image!));
                                  },
                                  icon: const FaIcon(FontAwesomeIcons.cartPlus),
                                  label: const Text('Add to Cart',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Center(
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        iconColor: Colors.white),
                                    icon: const FaIcon(FontAwesomeIcons.heart),
                                    onPressed: () {
                                      FireRDbService().addWishList(
                                          data: FireRdbData(
                                              name: snapshot[index].name!,
                                              price: snapshot[index].price!,
                                              image: snapshot[index].image!));
                                    },
                                    label: const Text('Add to Wishlist',
                                        style: TextStyle(color: Colors.white))),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
