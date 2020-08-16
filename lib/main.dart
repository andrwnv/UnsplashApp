import 'package:flutter/material.dart';

import 'package:unsplash_app/views/main_gallery_widget.dart';
import 'package:unsplash_app/views/full_screen_widget.dart';

void main() {
  runApp(MaterialApp(initialRoute: GalleryWidget.routeName,
      routes: {
        GalleryWidget.routeName: (context) => GalleryWidget(),
        FullScreenWidget.routeName: (context) => FullScreenWidget(),
  }));
}
