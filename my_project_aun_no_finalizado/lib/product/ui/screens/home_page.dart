import 'package:flutter/material.dart';
import 'package:my_project/Product/ui/widgets/profile_background.dart';
import 'package:my_project/infraestructure/driven_adapters/product/api_rest.dart';
import 'package:my_project/product/ui/widgets/product_card.dart';

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
                //return ProductCard(new Product(origen: "origen",tipo: "tipo", sabor: "sabor", imagen: "http://i0.wp.com/farallonesdelcitara.bioexploradores.com/wp-content/uploads/2022/10/IMG_3619-2.jpg?resize=790%2C415&ssl=1"));
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                    itemCount: list.length,
                    itemBuilder: (context, index){
                    return ProductCard(list[index]);
                    });
              }
            }),
      ],
    );
  }

}
