import 'package:flutter/material.dart';
import 'package:reog_apps_flutter/src/screens/widgets/main_pop_up_menu.dart';
import 'package:easy_localization/easy_localization.dart';

class WallpaperDetailsPage extends StatefulWidget {
  final String _url;
  WallpaperDetailsPage(this._url);
  @override
  _WallpaperDetailsPageState createState() => _WallpaperDetailsPageState(_url);
}

class _WallpaperDetailsPageState extends State<WallpaperDetailsPage> {
  final String _url;
  _WallpaperDetailsPageState(this._url);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        _navigateBack();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                _navigateBack();
              }),
          title: Text('wallpaper'.tr()),
          actions: <Widget>[
            MainPopUpMenu(false),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Center(
                  child: Image.network(_url,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width),
                ),
              ),
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: Text(
                  'set_wallpaper'.tr().toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateBack() {
    Navigator.pop(context, true);
  }
}
