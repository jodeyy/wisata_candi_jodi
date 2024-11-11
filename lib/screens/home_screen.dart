import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data_dart.dart';
import 'package:wisata_candi/models/candi.dart';

import '../widget/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo: 1 Buat appbar dengan judul wisata Candi
      appBar: AppBar(title: Text('Wisata Candi'),),
      // Todo: 2. Buat body dengan GridView.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          padding: EdgeInsets.all(8),
          itemCount: candiList.length,
          itemBuilder: (context,index){
        Candi candi = candiList[index]; // Ambil candi berdasarkan index
        return ItemCard(candi: candi);

    }
      // Todo: 3. Buat ItemCard sebagai return value dari GridView.Builder
    ),
    );
  }
}
