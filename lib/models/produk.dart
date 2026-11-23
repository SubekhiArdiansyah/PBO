class Produk {
  final String kode;
  String nama;
  String kategori;
  double _harga; // private: tidak bisa diakses langsung dari luar
  int _stok;
  bool tersedia;

  Produk(this.kode, this.nama, this.kategori, this._harga, this._stok)
      : tersedia = _stok > 0;

  // Named constructor: untuk produk baru yang stok-nya belum diisi
  Produk.baru(String kode, String nama, String kategori, double harga)
      : this(kode, nama, kategori, harga, 0);

  // Named constructor: untuk produk yang langsung didaftarkan dengan stok awal
  Produk.restok(
      String kode,
      String nama,
      String kategori,
      double harga,
      int stokAwal,
      ) : this(kode, nama, kategori, harga, stokAwal);

  // Getter: cara BACA _harga dari luar class
  double get harga => _harga;

  // Setter: cara UBAH _harga dari luar class, sekaligus tempat validasi
  set harga(double nilai) {
    if (nilai < 0) {
      throw ArgumentError('Harga tidak boleh negatif');
    }
    _harga = nilai;
  }

  // Getter: cara BACA _stok dari luar class
  int get stok => _stok;

  String tampilkanInfo(String prefix) =>
      '$prefix$nama - Rp${harga.toStringAsFixed(0)}';

  // Optional positional: catatan boleh diisi, boleh tidak
  void tambahStok(int jumlah, [String? catatan]) {
    _stok += jumlah;
    tersedia = _stok > 0;

    if (catatan != null) {
      print('Catatan restok: $catatan');
    }
  }

  // Named wajib: persen HARUS diisi
  // alasan opsional
  void aturDiskon({required double persen, String? alasan}) {
    final potongan = harga * persen / 100;
    harga -= potongan;

    print(
      'Diskon $persen% diterapkan${alasan != null ? ' ($alasan)' : ''}',
    );
  }

  String cetakStruk({bool includeDiskon = false}) {
    final buffer = StringBuffer()
      ..writeln('$nama ($kategori)')
      ..writeln('Harga: Rp${harga.toStringAsFixed(0)}')
      ..writeln('Stok tersisa: $stok');

    return buffer.toString();
  }
}