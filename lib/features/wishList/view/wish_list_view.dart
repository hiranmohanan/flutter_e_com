import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 10),
      children: [
        SearchAnchor.bar(suggestionsBuilder: 
        (context, controller) {
          return [
             ListTile(
              title: const Text('Product 1'),
              onTap: () {
                controller.text = 'Product 1';
              },
            ),
             ListTile(
              title: const Text('Product 2'),
              onTap: () {
                controller.text = 'Product 2';
              },
            ),
             ListTile(
              title: const Text('Product 3'),
              onTap: () {
                controller.text = 'Product 3';
              },
            ),
          ];
        },
        ),
       const SizedBox(
          height: 30,
        ),
        Container(
          padding:  const EdgeInsets.only(bottom: 200),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
              itemCount: 10,
             
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.shopping_cart)),
                  title: const Text('Product 1'),
                  subtitle: const Text('Description'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    
                  },
                );
              },
          ),
        ),
      ],
    );
  }
}