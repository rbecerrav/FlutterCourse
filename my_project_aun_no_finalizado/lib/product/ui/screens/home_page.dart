import 'package:flutter/material.dart';
import 'package:my_project/Product/ui/widgets/profile_background.dart';
import 'package:my_project/infraestructure/driven_adapters/product/api_rest.dart';

import '../../../product/ui/widgets/product.dart';


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
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                    itemCount: list.length,
                    itemBuilder: (context, index){
                      return Container(
                        height: 50,
                          child: Text(list[index].toString(),
                            style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis));
                    });
              }
            }),
        /*ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );}
        )*/
      ],
    );
  }

}
