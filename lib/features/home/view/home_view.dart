import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/features/home/widgets/widgets.dart';
import 'package:flutter_e_com/features/product/view/prouct_view.dart';
import 'package:flutter_e_com/features/profile/view/profile_view.dart';
import 'package:flutter_e_com/features/wishList/view/wish_list_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../cart/view/cart_view.dart';
import '../../product/bloc/product_bloc.dart';
import '../../wishList/bloc/wishlist_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeInitialPage());

 
    List<Widget> body = [
      const ProductView(),
      const WishListView(),
      const CartView(),
      const ProfileView(),
    ];
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomePageState) {
            return body[state.index];
          }
          return const ProductView();
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomePageState) {
            return BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              unselectedItemColor: Theme.of(context).colorScheme.onSurface,
              showSelectedLabels: true,
              type: BottomNavigationBarType.shifting,
              
              onTap: (index) {
                BlocProvider.of<HomeBloc>(context).add(HomePageChange(index));
                switch(index){
                  case 0:
                    context.read<ProductBloc>().add(ProductCallEvent());
                    break;
                  case 1:
                    context.read<WishlistBloc>().add(WishlistCallEvent());
                    break;
                  case 2:
                    context.read<CartBloc>().add(CartCallEvent());
                    break;
                  case 3:
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile')));
                    break;
                }
              },
              showUnselectedLabels: true, currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidHeart),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.cartShopping),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidUser),
                  label: 'Profile',
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
           
            return const ProductAddSheet();
          });
         
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
