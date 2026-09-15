import '../models/product.dart';

List<Product> daftarProduk = [
  Product(
    id: 1,
    name: 'PopMie',
    price: 15000,
    imageUrl: 'popmie.jpg',
    category: 'Makanan',
    stock: 10,
    description: 'Mie instan rasa ayam bawang',
  ),

  Product(
    id: 2,
    name: 'Flower Bricks',
    price: 70000,
    imageUrl: 'flower_bricks.jpg',
    category: 'Mainan',
    stock: 20,
    description: 'Mainan lego berbentuk bunga',
  ),

  Product(
    id: 3,
    name: 'Merche Bag',
    price: 300000,
    imageUrl: 'merche_bag.jpg',
    category: 'Fashion',
    stock: 5,
    description: 'Tas kuliah warna maroon',
  ),

  Product(
    id: 4,
    name: 'Tumbler Nuan',
    price: 50000,
    imageUrl: 'tumbler.jpg',
    category: 'Peralatan',
    stock: 8,
    description: 'Botol minum berkapasitas 750ml',
  ),

  Product(
    id: 5,
    name: 'Krayon Joyko',
    price: 25000,
    imageUrl: 'krayon.jpg',
    category: 'Alat Tulis',
    stock: 15,
    description: 'Krayon 24 warna untuk menggambar',
  ),

  Product(
    id: 6,
    name: 'Imboost Tablet',
    price: 75000,
    imageUrl: 'imboost.jpg',
    category: 'Kesehatan',
    stock: 6,
    description: 'Vitamin untuk kesehatan',
  ),

  Product(
    id: 7,
    name: 'Lifeboy Handwash',
    price: 8000,
    imageUrl: 'lifeboy.jpg',
    category: 'Kesehatan',
    stock: 4,
    description: 'Sabun tangan untuk kebersihan',
  ),

  Product(
    id: 8,
    name: 'Mouse Logitech',
    price: 600000,
    imageUrl: 'mouse.jpg',
    category: 'Elektronik',
    stock: 30,
    description: 'Mouse wireless untuk komputer',
  ),
];

void main() {
  print('=== DAFTAR PRODUK TOKOKITA ===');

  for (int i = 0; i < daftarProduk.length; i++) {
    print('\nProduk ${i + 1}');
    daftarProduk[i].tampilkanInfo();
    print('Status Stok: ${daftarProduk[i].getStatusStok()}');
  }
}