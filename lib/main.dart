import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_e_com/features/auth/view/auth_view.dart';
import 'package:flutter_e_com/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_e_com/features/home/bloc/home_bloc.dart';
import 'package:flutter_e_com/features/home/view/home_view.dart';
import 'package:flutter_e_com/features/product/bloc/product_bloc.dart';

import 'features/wishList/bloc/wishlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
        ),
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc(),
        ),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthView(),
          '/home': (context) => const HomeView(),
        },
      ),
    );
  }
}
