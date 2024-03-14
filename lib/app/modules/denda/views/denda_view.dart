import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../routes/app_pages.dart';
import '../controllers/denda_controller.dart';

class DendaView extends GetView<DendaController> {
  const DendaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Denda'),
          centerTitle: true,
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            DataPinjam dataPinjam = state[index];
            return ListTile(
              title: Text("${dataPinjam.book?.judul}"),
              subtitle: Text("Penulis ${dataPinjam.book?.penulis}\n${dataPinjam.tanggalPinjam} - ${dataPinjam.tanggalKembali}"),
            );
          },
          separatorBuilder: (context, index)=> Divider(),
        ))
    );
  }
}
