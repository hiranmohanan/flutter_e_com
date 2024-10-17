part of 'widgets.dart';

ElevatedButton cartButton(BuildContext context, List<FireRdbData> snapshot, int index) {
    return ElevatedButton.icon(
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
                              );
  }