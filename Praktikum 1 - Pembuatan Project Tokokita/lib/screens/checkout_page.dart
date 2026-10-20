
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Obx(() {
        // Menggabungkan produk yang sama
        final Map<int, Product> produkUnik = {
          for (final product in cartController.cartItems)
            product.id: product,
        };

        final products = produkUnik.values.toList();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ringkasan Pesanan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: products.isEmpty
                    ? const Center(
                        child: Text('Tidak ada pesanan'),
                      )
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final quantity =
                              cartController.getQuantity(product);

                          return Card(
                            child: ListTile(
                              title: Text(product.name),
                              subtitle: Text(
                                '$quantity item x Rp${product.price.toStringAsFixed(0)}',
                              ),
                              trailing: Text(
                                'Rp${(product.price * quantity).toStringAsFixed(0)}',
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const Divider(),

              Text(
                'Total Item: ${cartController.totalItem}',
              ),

              const SizedBox(height: 8),

              Text(
                'Total Harga: Rp${cartController.totalHarga.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: products.isEmpty
                      ? null
                      : () {
                          Get.snackbar(
                            'Pesanan',
                            'Ringkasan pesanan berhasil ditampilkan.',
                          );
                        },
                  child: const Text('Konfirmasi Pesanan'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
