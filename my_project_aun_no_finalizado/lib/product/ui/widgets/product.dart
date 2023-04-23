import 'dart:convert';

class Product {
  int? id;
  String tipo;
  String origen;
  String sabor;
  String imagen;

  Product({
    this.id,
    required this.tipo,
    required this.origen,
    required this.sabor,
    required this.imagen
  });

factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["products_id"],
    tipo: json["tipo"],
    origen: json["origen"],
    sabor: json["sabor"],
    imagen: json["imagen"]
  );

  Map<String, dynamic> toJson() => {
    "products_id": id,
    "tipo": tipo,
    "origen": origen,
    "sabor": sabor,
    "imagen": imagen
  };
  @override
  String toString() {
    return 'Product{id: $id, tipo: $tipo, origen: $origen, sabor: $sabor, imagen: $imagen}';
  }
}

List<Product> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}