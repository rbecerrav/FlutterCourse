import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../../../product/ui/widgets/product.dart';

class ApiREST{
  final String baseUrl = "http://localhost:3000/products";
  Client client = Client();
  Future<List<Product>> getProfiles() async{
    print("voy a consumir el api ${baseUrl}");
    //final response = await client.get("http://run.mocky.io/v3/ac04c20b-9a98-473f-9d92-490b212b2273");
    final response = await client.get("http://3.142.37.77:3000/products");
    print("RESPUESTA DEL API");
    //print(response.body.toString());
    if(response.statusCode == 200){
      return profileFromJson(response.body);
    }else{
      return [Product(origen: "origen",
          tipo: "tipo",
          sabor: "sabor", imagen: "imagen")];
    }
  }

  Future<bool> createProfile(Product data) async{
    final response = await client.post(
      "$baseUrl/api/profile",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if(response.statusCode == 201){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateProfile(Product data) async{
    final response = await client.put(
      "$baseUrl/api/profile/${data.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async{
    final response = await client.delete(
      "$baseUrl/api/profile/$id",
      headers: {"content-type": "application/json"},
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}
List<Product> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  var printData=List<Product>.from(data.map((item) => Product.fromJson(item)));
  //print("mapeando respuesta ${printData.toString()}");
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String profileToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}