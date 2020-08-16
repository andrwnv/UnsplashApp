import 'package:flutter/material.dart';

import 'package:unsplash_app/misc/interface_image.dart';
import 'package:unsplash_app/misc/colors.dart';
import 'full_screen_widget.dart';

class ImageCard extends StatefulWidget {
  ImageCard({Key key, this.image});

  final IImage image;

  @override
  _ImageCard createState() => _ImageCard(image);
}

class _ImageCard extends State<ImageCard> {
  IImage _image;

  _ImageCard(IImage image) {
    _image = image;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(context, FullScreenWidget.routeName, arguments: _image),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: AppColors.ImageCardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 8.0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(_image.authorAvatar, scale: 1.2)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        _image.authorName,
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Image.network(_image.fullImgUrl),
            )
          ],
        )
    );
  }
}
