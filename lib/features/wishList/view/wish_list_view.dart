import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/features/wishList/bloc/wishlist_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistError) {
          return Center(
            child: Text(state.message),
          );
        }
        else if(state is WishlistLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
       else if (state is WishlistLoaded) {
          final snapshot = state.products;
          debugPrint('WishlistLoaded in view ${state.products.length}');
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
                child: ListView.builder(
                  itemCount: snapshot.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 500,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(snapshot[index].image!),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(snapshot[index].name!),
                      subtitle: Text(snapshot[index].price!.toString()),
                      trailing: const FaIcon(FontAwesomeIcons.trashCan),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
