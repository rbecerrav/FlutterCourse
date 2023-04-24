import 'package:flutter/material.dart';
import 'package:my_project/product/ui/widgets/create_product.dart';
import 'package:my_project/product/ui/widgets/product.dart';



class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  final tipo = TextEditingController();
  final origen = TextEditingController();
  final sabor = TextEditingController();

  Widget MyForm(){
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: tipo,
                    decoration: InputDecoration(
                        labelText: "Tipo",
                        hintText: "Tipo de cafe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  TextFormField(
                    controller: origen,
                    decoration: InputDecoration(
                        labelText: "Origen",
                        hintText: "Origen del cafe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                  TextFormField(
                    controller: sabor,
                    decoration: InputDecoration(
                        labelText: "Sabor",
                        hintText: "Explique el sabor del cafe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ],
              )),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print("El producto es!!!!!!!!!!!!!!! ${myController.text}");
                Product product = new Product(tipo: tipo.text,origen: origen.text,sabor:sabor.text,imagen:"" );
                CreateProduct createProduct = new CreateProduct(product);
                createProduct.create();
                Navigator.pop(context);
              },
              child: Text('GUARDAR!'),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(//Esto es para que los usuarios no le tengan
                  //que atinar siempre a la rayita del back, sino al area
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left,color: Colors.black,size: 45,),
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                ),
              ),
              Flexible(
                  child: Container(
                      child: Container(
                        padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                        child: Text(
                            "Add a new Place",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),),
                      )))
            ],
          ),
          MyForm()
        ],
      ),
    );;
  }

}