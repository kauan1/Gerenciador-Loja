import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  void imageSelected(File image) async {
    if(image!=null){
      /*File croppedImage = await ImageCropper.cropImage(
        /*para usar o imageCropper precisa colar no AndroidManifest.xml as seguintes linhas
          <activity
          android:name="com.yalantis.ucrop.UCropActivity"
          android:screenOrientation="portrait"
          android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>*/
        sourcePath: image.path,
        ratioX: 1.0,
        ratioY: 1.0
      );*/
      onImageSelected(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: (){},
        builder: (context)=> Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              child: Text("Câmera"),
              onPressed: ()async{
                File image = await ImagePicker.pickImage(source: ImageSource.camera);
                imageSelected(image);
              },
            ),
            FlatButton(
              child: Text("Galeria"),
              onPressed: () async{
                File image = await ImagePicker.pickImage(source: ImageSource.gallery);
                imageSelected(image);
              },
            )
          ],
        ));
  }
}
