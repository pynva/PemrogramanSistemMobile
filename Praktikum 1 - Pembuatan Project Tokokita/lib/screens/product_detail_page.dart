import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState
    extends State<ProductDetailPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Rp ${widget.product.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Kategori: '
                      '${widget.product.category}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Status Stok: '
                      '${widget.product.getStatusStok()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              widget.product.description ??
                  'Tidak ada deskripsi produk.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Jumlah',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: jumlah > 1
                          ? () {
                              setState(() {
                                jumlah--;
                              });
                            }
                          : null,

                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius:
                            BorderRadius.circular(8),
                      ),

                      child: Text(
                        '$jumlah',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          jumlah++;
                        });
                      },

                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    jumlah,
                  );
                },

                icon: const Icon(
                  Icons.shopping_cart,
                ),

                label: const Text(
                  'Tambah ke Keranjang',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}