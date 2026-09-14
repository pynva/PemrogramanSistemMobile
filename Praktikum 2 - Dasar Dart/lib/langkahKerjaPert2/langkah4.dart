void main() {
  double hitungHargaSetelahDiskon(double harga, double diskon) {
    double potongan = harga * diskon / 100;
    double hargaAkhir = harga - potongan;

    return hargaAkhir;
  }

  double harga = 20000;
  double diskon = 20;

  double hasil = hitungHargaSetelahDiskon(harga, diskon);

  print('Harga awal: Rp$harga');
  print('Diskon: $diskon%');
  print('Harga setelah diskon: Rp$hasil');

  double hitungHarga({
    required double harga,
    double diskon = 0,
  }) {
    double hasil = harga - (harga * diskon / 100);
    return hasil;
  }

  print('\nDengan named parameter:');
  print(hitungHarga(harga: 10000, diskon: 20));

  print('\nTanpa diskon:');
  print(hitungHarga(harga: 10000));

  String formatRupiah(double harga) => 'Rp$harga';

  print('\nArrow function:');
  print(formatRupiah(10000));
}