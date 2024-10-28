import 'package:flutter/material.dart';
import 'package:myapp/ui/edit_data.dart';
import 'package:myapp/ui/produk_form.dart';
import 'package:myapp/ui/produk_detail.dart';
import 'data_storage.dart';

class DataPenjualan extends StatefulWidget {
  const DataPenjualan({Key? key}) : super(key: key);

  @override
  _DataPenjualanState createState() => _DataPenjualanState();
}

class _DataPenjualanState extends State<DataPenjualan> {
  @override
  void initState() {
    super.initState();
  }

  void _addDataPenjualan(Map<String, dynamic> newData) {
    setState(() {
      DataStorage.dataPenjualan.add(newData);
    });
    _showSnackBar('Data berhasil ditambahkan!');
  }

  void _updateDataPenjualan(int index, Map<String, dynamic> updatedData) {
    setState(() {
      DataStorage.dataPenjualan[index] = updatedData;
    });
    _showSnackBar('Data berhasil diperbarui!');
  }

  void _deleteDataPenjualan(int index) {
    setState(() {
      DataStorage.dataPenjualan.removeAt(index);
    });
    _showSnackBar('Data berhasil dihapus!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProdukForm(),
                ),
              );

              if (newData != null) {
                _addDataPenjualan(newData);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: DataStorage.dataPenjualan.length,
        itemBuilder: (context, index) {
          final data = DataStorage.dataPenjualan[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdukDetail(
                    kodeProduk: data["noFaktur"],
                    namaProduk: data["namaBarang"],
                    hargaProduk: int.tryParse(data["hargaBarang"].toString()) ?? 0,
                    tanggal: data["tanggal"],
                    namaCustomer: data["namaCustomer"],
                    jumlahBarang: int.tryParse(data["jumlahBarang"].toString()) ?? 0,
                    totalHarga: int.tryParse(data["totalHarga"].toString()) ?? 0,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("No Faktur: ${data["noFaktur"]}", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Tanggal: ${data["tanggal"]}"),
                    Text("Nama Customer: ${data["namaCustomer"]}"),
                    Text("Nama Barang: ${data["namaBarang"]}"),
                    Text("Harga Barang: Rp. ${data["hargaBarang"]}"),
                    Text("Jumlah Barang: ${data["jumlahBarang"]}"),
                    Text("Total Harga: Rp. ${data["totalHarga"]}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final updatedData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditData(initialData: data),
                              ),
                            );

                            if (updatedData != null) {
                              _updateDataPenjualan(index, updatedData);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteDataPenjualan(index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
