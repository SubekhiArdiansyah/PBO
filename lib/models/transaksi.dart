import 'bisa_dicetak.dart';
import 'item_transaksi.dart';
import 'produk.dart';

class Transaksi implements BisaDicetak {
  final String idTransaksi;
  // Private: hanya Transaksi yang boleh mengelola items
  final List<ItemTransaksi> _items = [];

  Transaksi(this.idTransaksi);

  // Transaksi sendiri yang membuat ItemTransaksi.
  // Ini menunjukkan Composition.
  void tambahItem(Produk produk, int jumlah) {
    _items.add(ItemTransaksi(produk, jumlah));
  }

  // Mengembalikan items dalam bentuk yang tidak bisa dimodifikasi dari luar.
  List<ItemTransaksi> get items => List.unmodifiable(_items);

  // Menghitung total harga seluruh item transaksi.
  double get totalHarga =>
      _items.fold(0.0, (sum, item) => sum + item.subtotal);

  @override
  String cetakStruk() {
    final buffer = StringBuffer()..writeln('=== STRUK: $idTransaksi ===');
    for (final item in _items) {
      buffer.writeln(
        '${item.produk.nama} x${item.jumlah} = Rp${item.subtotal.toStringAsFixed(0)}',
      );
    }
    buffer.writeln('TOTAL: Rp${totalHarga.toStringAsFixed(0)}');
    return buffer.toString();
  }
}

