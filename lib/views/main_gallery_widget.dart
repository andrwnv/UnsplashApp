import 'package:flutter/material.dart';

import 'package:unsplash_app/network/unsplash_image.dart';
import 'package:unsplash_app/network/unsplash_api.dart';
import 'package:unsplash_app/views/image_card.dart';

class GalleryWidget extends StatefulWidget {
  GalleryWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GalleryWidget createState() => _GalleryWidget();
}

class _GalleryWidget extends State<GalleryWidget> {
  UnsplashAPI _api = UnsplashAPI();
  int _pageNumber = 1;
  int _countOfPictures = 10;

  String title = "test title";

  bool _isLoading = true;
  bool _hasMore = true;

  final _imgs = <ImageCard>[];

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
  }

  void _loadMore() {
    _pageNumber += 1;
    _isLoading = true;
    _api
        .getPictures(_pageNumber, _countOfPictures)
        .then((List<UnsplashImage> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          for (var i in fetchedList) {
            _imgs.add(ImageCard(url: i));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unsplash App',
        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Unsplash Test App"),
            ),
            body: FutureBuilder<List<UnsplashImage>>(
              future: _api.getPictures(_pageNumber, _countOfPictures),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UnsplashImage>> snapshot) {
                List<Widget> _children;
                if (snapshot.hasData) {
                } else if (snapshot.hasError) {
                  _children = <Widget>[
                    Column(children: <Widget>[
                      Icon(Icons.error_outline,
                          color: Colors.redAccent, size: 60),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ])
                  ];

                  print(snapshot.error);
                } else {
                  _children = <Widget>[
                    Row(children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ])
                  ];
                }
                return Center(
                  child: ListView.builder(
                      itemCount: _hasMore ? _imgs.length + 1 : _imgs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= _imgs.length) {
                          if (!_isLoading) {
                            _loadMore();
                          }
                          return Center(
                            child: SizedBox(
                              child: CircularProgressIndicator(),
                              height: 24,
                              width: 24,
                            ),
                          );
                        }

                        return Container(
                          child: _imgs[index],
                        );
                      }),
                );
              },
            )
        )
    );
  }
}