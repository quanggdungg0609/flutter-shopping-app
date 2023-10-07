import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:flutter_shop_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CartProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 212, 21),
            primary: const Color.fromARGB(255, 255, 214, 34),
            secondary: const Color.fromARGB(255, 209, 244, 255),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
