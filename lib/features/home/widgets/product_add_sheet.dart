part of 'widgets.dart';

class ProductAddSheet extends StatefulWidget {
  const ProductAddSheet({super.key});

  @override
  State<ProductAddSheet> createState() => _ProductAddSheetState();
}

class _ProductAddSheetState extends State<ProductAddSheet> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(); 
    priceController = TextEditingController();
    imageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(onClosing: (){}, builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        
                      ),
                    ),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                      ),
                    ),
                    TextField(
                      controller: imageController,
                      decoration: const InputDecoration(
                        labelText: 'Image',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FireRDbService().addProduct(
                          data: FireRdbData(
                            name: nameController.text,
                            price: int.parse(priceController.text.toString()),
                            image: imageController.text,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            });
  }
}