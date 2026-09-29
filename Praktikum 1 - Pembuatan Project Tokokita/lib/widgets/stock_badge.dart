import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color warna;

    if (status == 'Tersedia') {
      warna = Colors.green;
    } else if (status == 'Stok Terbatas') {
      warna = Colors.orange;
    } else {
      warna = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}