import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';
import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      home: const MainPage(),

      routes: {
        '/detail': (context) {
          final arguments =
              ModalRoute.of(context)?.settings.arguments;

          if (arguments is Product) {
            return ProductDetailPage(
              product: arguments,
            );
          }

          return const Scaffold(
            body: Center(
              child: Text('Data produk tidak ditemukan'),
            ),
          );
        },
      },
    );
  }
}