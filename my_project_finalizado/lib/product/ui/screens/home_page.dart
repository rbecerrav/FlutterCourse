import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_project/Product/ui/widgets/profile_background.dart';
import 'package:my_project/infraestructure/driven_adapters/product/api_rest.dart';
import 'package:my_project/product/ui/widgets/product_card.dart';

import '../../../product/ui/widgets/product.dart';
import 'add_product.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiREST? apiRest;
  //Future<List<Product>>? products;
  List<Product>? products;
  List<Product>? productsList;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  var selectedIndex= 0;
  
  @override
  void initState() {
    super.initState();
    apiRest = ApiREST();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        FutureBuilder(
          future: apiRest?.getProfiles(),
            builder: (context, future){
              if(!future.hasData)
                return Container(child: Text('X'),); // Display empty container if the list is empty
              else{
                List<Product> list = future.data as List<Product>;
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                    itemCount: list.length,
                    itemBuilder: (context, index){
                    return ProductCard(list[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    );
              }
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AddProduct()))
                          .then((value) {
                        Timer(Duration(seconds: 6), () {
                          setState(() {});
                        });
                      });
                    },
                    child: Text('Registrar nuevo producto')),
              ),
            )
      ],
    );
  }


}
