import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double harga;

  const PriceLabel({
    super.key,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp$harga',
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}