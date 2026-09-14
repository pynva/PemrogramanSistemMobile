void main() {
  double hargaSatuan = 5000.0;
  int jumlahBeli = 3;
  int stokAwal = 100;

  double totalHarga = hargaSatuan * jumlahBeli;
  int sisaStok = stokAwal - jumlahBeli;

  print('Harga Satuan: $hargaSatuan');
  print('Jumlah Beli: $jumlahBeli');
  print('Total Harga: $totalHarga');
  print('Stok Awal: $stokAwal');
  print('Sisa Stok: $sisaStok');

  print('\nOperator Aritmatika');
  print('Penjumlahan: ${hargaSatuan + 1000}');
  print('Pengurangan: ${hargaSatuan - 1000}');
  print('Perkalian: ${hargaSatuan * 3}');
  print('Pembagian: ${hargaSatuan / 2}');
  print('Sisa bagi stok: ${stokAwal % 3}');

  print('\nOperator Perbandingan');
  print('Harga == 5000: ${hargaSatuan == 5000}');
  print('Harga != 2000: ${hargaSatuan != 2000}');
  print('Harga > 7000: ${hargaSatuan > 7000}');
  print('Harga < 100000: ${hargaSatuan < 100000}');
  print('Stok >= 100: ${stokAwal >= 100}');
  print('Stok <= 100: ${stokAwal <= 100}');

  bool layakDitampilkan = stokAwal > 0 && hargaSatuan > 0;

  print('\nOperator Logika');
  print('Produk layak ditampilkan: $layakDitampilkan');
  print('Stok tersedia atau harga murah: ${stokAwal > 0 || hargaSatuan < 3000}');
  print('Produk tidak habis: ${!(stokAwal == 0)}');
}