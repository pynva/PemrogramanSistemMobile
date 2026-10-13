import 'package:flutter/material.dart';
import '../data/list_product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),

          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: const [
                  Text(
                    'TokoKita',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Belanja jadi lebih mudah',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const Icon(
                Icons.shopping_cart,
                size: 28,
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: daftarProduk.length,

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  final jumlah =
                      await Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: daftarProduk[index],
                  );

                  if (jumlah != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          '$jumlah item berhasil ditambahkan ke keranjang',
                        ),
                      ),
                    );
                  }
                },

                child: ProductCard(
                  product: daftarProduk[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}