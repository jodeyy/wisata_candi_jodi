import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  String actionLabel = 'Belum ada Aksi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interaction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  actionLabel = 'Pengguna melakukan Tap';
                });
              },
              onDoubleTap: (){
                setState(() {
                  actionLabel = 'Pengguna melakukan Double Tap';
                });
              },
              onLongPress: (){
                setState(() {
                  actionLabel = 'Pengguna menekan Tap';
                });
              },

              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)
                ),
                alignment: Alignment.center,

                child: Text('Aksi',
                style: TextStyle(color: Colors.white,fontSize: 18),),

              ),
            ),
      SizedBox(height: 16,),
            Text(actionLabel,style: TextStyle(fontSize: 18),)


          ],




        ),
      ),
    );
  }
}

