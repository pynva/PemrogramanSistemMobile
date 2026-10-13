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