import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/features/cart/bloc/cart_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
    
      builder: (context,state) {
        if(state is CartError){
          return Center(
            child: Text(state.message),
          );
        }
        else if(state is CartLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is CartLoaded){
       
         
        

        final cartData = state.cartItems; 
        return ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Cart View',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

           
            const SizedBox(
              height: 30,
            ),
           Container(
             padding: const EdgeInsets.only(bottom: 200),
                height: MediaQuery.sizeOf(context).height*0.6,
                width: MediaQuery.sizeOf(context).width,
             child: ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 500,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(cartData[index].image!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(cartData[index].name!),
                        subtitle: Text(cartData[index].price!.toString()),
                        trailing: const FaIcon(FontAwesomeIcons.trashCan),
                        onTap: () {},
                      );
                    },
                  ),
           ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height*0.3,
              decoration: BoxDecoration(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(20),
                 topRight: Radius.circular(20),
               ),
               border: Border.all(
                 color: Theme.of(context).primaryColor,),
                // color: Theme.of(context).primaryColor,
              ),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: const Text('Total Amount'),
                    trailing: Text('\$${cartData.fold(0, (previousValue, element) => previousValue + element.price!)}'),
                  ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckOutView()));
                },
                label: const Text('Checkout'),
                icon: const FaIcon(FontAwesomeIcons.cartShopping)),
                ],
              ),
            ),
          ],
        );
      }
      return const SizedBox();
      }
    );
  }
}
