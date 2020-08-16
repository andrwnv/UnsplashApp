import 'package:flutter/material.dart';

import 'package:unsplash_app/misc/interface_image.dart';
import 'package:unsplash_app/misc/colors.dart';
import 'image_card.dart';

class FullScreenWidget extends StatelessWidget {
  static const String routeName = 'fullScreenWidget';

  @override
  Widget build(BuildContext context) {
    IImage _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.PrimaryColor,
          centerTitle: true,
          title: Image.asset('assets/images/unsplash_logo.png', scale: 8.5),
          leading: InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context)
          ),
        ),
        body: ListView(children: <Widget>[ImageCard(image: _args)])
    );
  }
}
