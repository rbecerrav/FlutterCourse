import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
//import 'package:image/image.dart' as ImageProcess;
class ImageConverter  {
  late String base64Image;

  //final _byteImage = Base64Decoder().convert(base64Image);

  Uint8List converter() {
    return Base64Decoder().convert(base64Image);
  }

  ImageConverter(this.base64Image);
}