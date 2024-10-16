import 'package:flutter/material.dart';
import 'package:flutter_e_com/features/product/view/prouct_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      const ProductView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:body[0],
      
      bottomNavigationBar: BottomNavigationBar(

        // backgroundColor: Theme.of(context).colorScheme.primary,
        // selectedItemColor: Theme.of(context).colorScheme.secondary,
        // unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        type: BottomNavigationBarType.shifting,
        useLegacyColorScheme: false,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookmark),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
