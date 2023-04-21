import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatos();
  }
  Future<void> getDatos() async {
    final datos = await Dio().get('https://api.coindesk.com/v1/bpi/currentprice.json');
    //http://api.zippopotam.us/us/98121
    print(datos.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service REST"),
      ),
      body: const Text("Contenido"),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          onPressed: () {}
      ),
    );
  }
}