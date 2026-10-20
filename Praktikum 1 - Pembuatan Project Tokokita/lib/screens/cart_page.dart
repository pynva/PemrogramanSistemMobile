
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Obx(() {
        // Menggabungkan produk yang sama menjadi satu baris
        final Map<int, Product> produkUnik = {
          for (final product in cartController.cartItems)
            product.id: product,
        };

        final products = produkUnik.values.toList();

        return Column(
          children: [
            Expanded(
              child: products.isEmpty
                  ? const Center(
                      child: Text(
                        'Keranjang masih kosong',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final quantity =
                            cartController.getQuantity(product);

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Harga: Rp${product.price.toStringAsFixed(0)}',
                                ),
                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: quantity > 0
                                          ? () {
                                              cartController
                                                  .kurangQuantity(
                                                product,
                                              );
                                            }
                                          : null,
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                      ),
                                    ),
                                    Text(
                                      '$quantity',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cartController
                                            .tambahQuantity(product);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        cartController
                                            .removeFromCart(product);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  'Subtotal: Rp${(product.price * quantity).toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Ringkasan keranjang dan tombol
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  const SizedBox(height: 12),

                  OutlinedButton.icon(
                    onPressed: () {
                      cartController
                          .konfirmasiKosongkanKeranjang();
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Kosongkan Keranjang'),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: products.isEmpty
                        ? null
                        : () {
                            Get.off(
                              () => const CheckoutPage(),
                            );
                          },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
