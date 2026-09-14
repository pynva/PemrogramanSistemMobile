void main() {
  const namaToko = 'Tokokita';
  var namaKasir = 'Yuya';
  final tanggal = DateTime.now();

  print('Nama Toko: $namaToko');
  print('Nama Kasir: $namaKasir');
  print('Tanggal: $tanggal');

  int stok = 100;
  double harga = 5000.0;
  String namaProduk = 'PopMie';
  bool statusTersedia = true;

  print('Stok: $stok');
  print('Harga: $harga');
  print('Nama Produk: $namaProduk');
  print('Status Produk: $statusTersedia');

  List<String> kategoriProduk = ['Elektronik', 'Fashion', 'Makanan', 'Kesehatan'];

  Map<String, dynamic> dataMentahProduk = {
    'id_produk': 101,
    'nama': 'PopMie',
    'harga': 5000.0,
    'stok': 100,
    'tersedia': true,
    'kategori': kategoriProduk[2],
  };

  print('Daftar Kategori: $kategoriProduk');
  print('Kategori Pilihan: ${kategoriProduk[1]}');

  print('Data Mentah Produk (Format Map/JSON):');
  print(dataMentahProduk);
}