import 'package:flutter/material.dart';
import 'package:my_project/product/ui/widgets/image_converter.dart';
import '../../../product/ui/widgets/product.dart';

class ProductCard extends StatelessWidget{
  Product product;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    ImageConverter imageConverter = new ImageConverter(product.imagen);
    final nombre = Text(
      this.product.tipo,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );
    final origen = Text(
      this.product.origen,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );
    final sabor = Text(
      this.product.sabor,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );
    final imagen = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0
      ),
      height: 220.0,
      //child: Image.memory(imageConverter.converter()),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.memory(imageConverter.converter()).image
              //image: NetworkImage(product.imagen)
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(

        width: screenWidth,
        //height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0)
              )
            ]
        ),
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                imagen,
                nombre,
                origen,
                sabor
              ],
            )
        ),
      ),
    );
  }

  ProductCard(this.product);
}