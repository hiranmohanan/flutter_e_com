part of 'widgets.dart';

ElevatedButton wishListButton(BuildContext context, List<FireRdbData> snapshot, int index) {
    return ElevatedButton.icon(
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
                                      style: TextStyle(color: Colors.white)));
  }