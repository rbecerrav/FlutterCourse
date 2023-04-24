
import 'package:flutter/cupertino.dart';
import 'package:my_project/product/enums.dart';
import 'package:my_project/product/ui/widgets/product.dart';

import '../../../infraestructure/driven_adapters/product/api_rest.dart';

class CreateProduct{
  late Product product;
  ApiREST? apiRest =new ApiREST();


  CreateProduct(this.product);



  void create() {

    product.id = validateIds();
    product.imagen=Enums().defaultImage;
    apiRest?.createProduct(product);
  }
  int? validateIds(){
    int? ultimo;
    FutureBuilder(

      future: apiRest?.getProfiles(),
      builder: (context, future){
          List<Product> list = future.data as List<Product>;
          ultimo = list.length + 1;
          return Container();

      }
      );
    return ultimo;


  }


}