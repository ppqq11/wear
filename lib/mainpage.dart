import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Mainpage extends StatefulWidget {
  @override
  State<Mainpage> createState() => MainpageState();
}

class MainpageState extends State<Mainpage> {
  //field
  File fil = File("path/to/file");

  late String name, detail, urlPicture;

  //Method
  // ignore: prefer_const_constructors

  Widget camerButton() {
    return IconButton(
        onPressed: () {
          chooseImage(ImageSource.camera);
        },
        icon: Icon(
          Icons.photo_camera,
          size: 80,
        ));
  }

  Future<void> chooseImage(ImageSource pickSource) async {
    try {
      var object = await ImagePicker()
          .pickImage(source: pickSource, maxWidth: 800.00, maxHeight: 800.00);
      setState(() {
        fil = object as File;
      });
    } catch (e) {}
  }

  //Widget showphoto() {
  //return ();
  //}
  Widget showPhoto() {
    var other = null;
    return Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: fil == null ? Image.asset('image/Photo.png') : Image.file(fil));
  }

  Widget gallry() {
    return IconButton(
        onPressed: () {
          chooseImage(ImageSource.gallery);
        },
        icon: Icon(Icons.collections, size: 80));
  }

  Widget show() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[gallry(), camerButton()],
    );
  }

  Widget List() {
    return Drawer();
  }

  Platform? pickedFile;

  Future uploadPhoto() async {
    Random random = Random();
    int i = random.nextInt(100000);
    final path = fil != null ? 'clothes/${fil.path}' : 'clothes/';
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    final Reference storageReference =
        firebaseStorage.ref().child('clothes/$i');

    UploadTask storageUplodeTask = storageReference.putFile(fil);

    try {
      urlPicture = (await (await storageUplodeTask.whenComplete(() => null))
              .ref
              .getDownloadURL())
          .toString();
    } catch (error) {
      print(error);
    }
    print('urlPicture =$urlPicture');
  }

  Widget uplodebutton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
              onPressed: () {
                uploadPhoto();
              },
              icon: Icon(Icons.cloud_upload),
              label: Text('Upload Data ')),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[showPhoto(), show(), uplodebutton()],
      )),
      drawer: List(),
    );
  }
}
