
import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final RxList<Product> cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  int getQuantity(Product product) {
    return cartItems.where((item) => item.id == product.id).length;
  }

  void tambahQuantity(Product product) {
    cartItems.add(product);
  }

  void kurangQuantity(Product product) {
    final index = cartItems.indexWhere(
      (item) => item.id == product.id,
    );

    if (index != -1) {
      cartItems.removeAt(index);
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere(
      (item) => item.id == product.id,
    );
  }

  int get totalItem => cartItems.length;

  double get totalHarga => cartItems.fold<double>(
        0.0,
        (total, product) => total + product.price,
      );

  // Mengosongkan semua produk
  void kosongkanKeranjang() {
    cartItems.clear();
  }

  // Konfirmasi sebelum mengosongkan keranjang
  void konfirmasiKosongkanKeranjang() {
    if (cartItems.isEmpty) {
      Get.snackbar(
        'Keranjang Kosong',
        'Tidak ada produk yang perlu dihapus.',
      );
      return;
    }

    Get.defaultDialog(
      title: 'Kosongkan Keranjang?',
      middleText: 'Semua produk di keranjang akan dihapus.',
      textCancel: 'Batal',
      textConfirm: 'Ya, Kosongkan',
      onConfirm: () {
        kosongkanKeranjang();
        Get.back();

        Get.snackbar(
          'Berhasil',
          'Keranjang berhasil dikosongkan.',
        );
      },
    );
  }
}
