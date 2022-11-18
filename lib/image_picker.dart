import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Image Picker from Gallery"),
          backgroundColor: Colors.redAccent
      ),
      body:  InkWell(
          onTap: getImage,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: CircleAvatar(
              radius: 38.0,
              child: ClipOval(
                child:(_image != null)
                    ? Image.file(_image!,fit: BoxFit.fitWidth,height:76,width: 100,)
                    : Image.asset('assets/Elecrition.png',fit: BoxFit.fitHeight,height:76,),
              ),
              backgroundColor: Colors.white,
            ),
          )
      ),
    );
  }
}
