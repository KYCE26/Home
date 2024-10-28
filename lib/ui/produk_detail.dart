import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? hargaProduk;
  final String? tanggal;
  final String? namaCustomer;
  final int? jumlahBarang;
  final int? totalHarga;

  const ProdukDetail({
    Key? key,
    this.kodeProduk,
    this.namaProduk,
    this.hargaProduk,
    this.tanggal,
    this.namaCustomer,
    this.jumlahBarang,
    this.totalHarga,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kode Produk : ${widget.kodeProduk}"),
            Text("Nama Produk : ${widget.namaProduk}"),
            Text("Harga Produk : ${widget.hargaProduk}"),
            Text("Tanggal : ${widget.tanggal}"),
            Text("Nama Customer : ${widget.namaCustomer}"),
            Text("Jumlah Barang : ${widget.jumlahBarang}"),
            Text("Total Harga : ${widget.totalHarga}"),
          ],
        ),
      ),
    );
  }
}
