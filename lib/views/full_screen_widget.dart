import 'package:flutter/material.dart';

import 'package:unsplash_app/misc/interface_image.dart';
import 'package:unsplash_app/views/image_card.dart';
import 'package:unsplash_app/misc/colors.dart';

class FullScreenWidget extends StatelessWidget {
  static const String routeName = 'fullScreenWidget';

  @override
  Widget build(BuildContext context) {
    IImage _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: Center(child: Image.asset('assets/images/unsplash_logo.png')),
        leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context)
        ),
      ),

      body: ImageCard(
        image: _args
      )
    );
  }
}
