import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:unsplash_app/views/main_gallery_widget.dart';
import 'package:unsplash_app/views/full_screen_widget.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/',
      routes: {
        '/': (context) => GalleryWidget(),
        '/second': (context) => FullScreenWidget(),
      }
    );
  }
}

void main() {
  runApp(Application());
}
