void main() {
  int stok = 3;

  if (stok == 0) {
    print('Produk habis');
  } else if (stok <= 5) {
    print('Stok produk terbatas');
  } else {
    print('Produk tersedia');
  }

  List<int> harga = [5000, 10000, 15000];
  int total = 0;

  for (int i = 0; i < harga.length; i++) {
    total = total + harga[i];
  }

  print('\nHarga produk: $harga');
  print('Total harga: Rp$total');

  int jumlahStok = 3;

  print('\nStok produk:');

  while (jumlahStok > 0) {
    print(jumlahStok);
    jumlahStok = jumlahStok - 1;
  }

  print('Stok habis');

  String kategori = 'Makanan';

  switch (kategori) {
    case 'Elektronik':
      print('\nKategori: Elektronik');
      print('Diskon: 10%');
      break;

    case 'Fashion':
      print('\nKategori: Fashion');
      print('Diskon: 15%');
      break;

    case 'Makanan':
      print('\nKategori: Makanan');
      print('Diskon: 5%');
      break;

    case 'Kesehatan':
      print('\nKategori: Kesehatan');
      print('Diskon: 2%');
      break;

    default:
      print('\nKategori tidak tersedia');
  }
}