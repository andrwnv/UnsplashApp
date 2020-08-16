import 'package:unsplash_app/misc/interface_image.dart';

class UnsplashImage extends IImage {
  final String _imgId;
  final String _authorName;
  final String _thumbImgUrl;
  final String _fullImgUrl;
  final String _authorAvatar;

  UnsplashImage(this._imgId, this._authorName, this._thumbImgUrl, this._fullImgUrl, this._authorAvatar);

  String get authorName => _authorName;

  String get thumbImgUrl => _thumbImgUrl;

  String get fullImgUrl => _fullImgUrl;

  String get authorAvatar => _authorAvatar;

  String get imgId => _imgId;

  @override
  String toString() {
    return 'Image {\n  _imgId: $_imgId,\n  _authorName: $_authorName, '
        '\n  _thumbImgUrl: $_thumbImgUrl, \n  _fullImgUrl: $_fullImgUrl \n} \n';
  }

  factory UnsplashImage.fromJson(Map<String, dynamic> response) {
    Map<String, dynamic> urls = response['urls'];
    Map<String, dynamic> user = response['user'];

    return UnsplashImage(
      response['id'],
      user['name'],
      urls['small'],
      urls['regular'],
      user['profile_image']['medium'],
    );
  }
}