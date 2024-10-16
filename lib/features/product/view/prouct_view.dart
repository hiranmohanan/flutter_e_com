import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

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
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.orientationOf(context) == Orientation.portrait
                        ? 2
                        : 3,
               
               mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: Column(
                      
                      children: [
                        Image.network(
                          'https://picsum.photos/250?image=9',
                          fit: BoxFit.fitWidth,
                        ),
                        const Text('Product Name'),
                        const Text('Product Description'),
                        const Text('Product Price'),
                        Center(
                          child: FilledButton(
                            
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              // Navigator.pushNamed(context, '/product');
                            },
                            child: const Text('View Product',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
