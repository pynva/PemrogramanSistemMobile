class Product {
  int id;
  String name;
  double price;
  String imageUrl;
  String category;
  int stock;
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  void tampilkanInfo() {
    print('Nama: $name');
    print('Harga: Rp$price');
    print('Kategori: $category');
    print('Stok: $stock');
    print('Deskripsi: $description');
  }

  // Method tambahan untuk mengembalikan String status berdasarkan jumlah stok
  String getStatusStok() {
    if (stock == 0) {
      return 'Habis';
    } else if (stock <= 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }
}

class DiscountedProduct extends Product {
  double discountPercent;

  DiscountedProduct({
    required int id,
    required String name,
    required double price,
    required String imageUrl,
    required String category,
    required int stock,
    String? description,
    required this.discountPercent,
  }) : super(
          id: id,
          name: name,
          price: price,
          imageUrl: imageUrl,
          category: category,
          stock: stock,
          description: description,
        );

  double hitungHargaFinal() {
    double potongan = price * discountPercent / 100;
    return price - potongan;
  }
}

void main() {
  Product produk1 = Product(
    id: 1,
    name: 'PopMie',
    price: 15000,
    imageUrl: 'popmie.jpg',
    category: 'Makanan',
    stock: 10,
    description: 'Mie instan rasa ayam bawang',
  );

  Product produk2 = Product(
    id: 2,
    name: 'Flower Bricks',
    price: 70000,
    imageUrl: 'flower_bricks.jpg',
    category: 'Mainan lego berbentuk bunga',
    stock: 20,
  );

  print('=== Produk 1 ===');
  produk1.tampilkanInfo();
  print('Status Stok: ${produk1.getStatusStok()}');

  print('\n=== Produk 2 ===');
  produk2.tampilkanInfo();
  print('Status Stok: ${produk2.getStatusStok()}');

  DiscountedProduct produk3 = DiscountedProduct(
    id: 3,
    name: 'Merche Bag',
    price: 300000,
    imageUrl: 'merche_bag.jpg',
    category: 'Fashion',
    stock: 5,
    description: 'Tas kuliah warna maroon',
    discountPercent: 20,
  );

  print('\n=== Produk Diskon ===');
  produk3.tampilkanInfo();
  print('Diskon: ${produk3.discountPercent}%');
  print('Harga Final: Rp${produk3.hitungHargaFinal()}');
  print('Status Stok: ${produk3.getStatusStok()}');
}