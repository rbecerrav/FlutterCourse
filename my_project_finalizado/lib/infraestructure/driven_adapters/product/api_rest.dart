import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../../../product/ui/widgets/product.dart';

class ApiREST{
  final String baseUrl = "http://3.142.37.77:3000/products";
  Client client = Client();
  Future<List<Product>> getProfiles() async{
    final response = await client.get("${baseUrl}");
    if(response.statusCode == 200){
      return profileFromJson(response.body);
    }else{
      return [Product(origen: "origen",
          tipo: "tipo",
          sabor: "sabor", imagen: "imagen")];
    }
  }

  Future<bool> createProduct(Product data) async{
    final response = await client.post(
      "${baseUrl}",
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

  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String profileToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}