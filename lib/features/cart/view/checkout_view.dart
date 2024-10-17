import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView(
      {super.key,

      required this.total,
      required this.grandTotal,
      required this.iteam});
  
  final int total;
  final int grandTotal;
  final int iteam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ListTile(
              title: Text('Name'),
              trailing: Text('John Doe'),
            ),
             ListTile(
              title: Text('total items'),
              trailing: Text(iteam.toString()),
            ),
             ListTile(
              title: Text('total price'),
              trailing: Text('$total\$'),
            ),
             ListTile(
              title: Text('grand total'),
              trailing: Text('$grandTotal\$'),
            ),
            const ExpansionTile(
              title: Text('Address'),
              childrenPadding: EdgeInsets.all(10),
              tilePadding: EdgeInsets.all(10),
              children: [
                ListTile(
                  title: Text('Street'),
                  trailing: Text('123 Main Street'),
                ),
                ListTile(
                  title: Text('City'),
                  trailing: Text('New York'),
                ),
                ListTile(
                  title: Text('State'),
                  trailing: Text('NY'),
                ),
                ListTile(
                  title: Text('Zip Code'),
                  trailing: Text('10001'),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Payment'),
              childrenPadding: const EdgeInsets.all(10),
              tilePadding: const EdgeInsets.all(10),
              children: [
                ListTile(
                  title: const Text('Razorpay'),
                  trailing: const Text('1234 5678 9012 3456'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment Successful'),
                      ),
                    );
                  },
                ),
              ],
            ),
            ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Checkout Successful'),
                    ),
                  );
                },
                label: const Text('Checkout'),
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
