import 'models/models.dart';

void main() {

  final nasiGoreng = Produk.restok('MKN001', 'Nasi Goreng', 'Makanan Berat', 15000, 20);
  final esTeh = Produk.baru('MNM001', 'Es Teh Mannis', 'Minumanan dingin', 5000);
  print('${nasiGoreng.nama}: stok ${nasiGoreng.stok}, tersedia: ${nasiGoreng.tersedia}');
  print('${esTeh.nama}: stok ${esTeh.stok}, tersedia: ${esTeh.tersedia}');

  print(nasiGoreng.tampilkanInfo('Menu: '));
  nasiGoreng.tambahStok(5, 'kiriman pagi');
  nasiGoreng.aturDiskon(persen: 10, alasan: 'promo akhir pekan');
  print(nasiGoreng.cetakStruk());

  final kategoriUnik = <String>{};

  kategoriUnik.add('Makanan Berat');
  kategoriUnik.add('Minuman Dingin');
  kategoriUnik.add('Makanan Berat');

  print(kategoriUnik);
}