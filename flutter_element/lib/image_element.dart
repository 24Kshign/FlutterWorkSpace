import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Image组件详解')), body: new ImageViewWidget());
  }
}

class ImageViewWidget extends StatefulWidget {
  NetworkImage networkImage = new NetworkImage(
      "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg",
      scale: 8.5);

  @override
  State<StatefulWidget> createState() {
    return new _ImageViewWidget();
  }
}

class _ImageViewWidget extends State<ImageViewWidget> {
  var imageUrl =
      "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg";

  var imageUrl2 =
      "http://n.sinaimg.cn/sports/2_img/upload/4f160954/107/w1024h683/20181128/Yrxn-hpinrya6814381.jpg";

  @override
  Widget build(BuildContext context) {
    return new Align(
      child: ListView(
        children: <Widget>[
          new Text('资源图片：'),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
//              new Image.file(
//                File('/storage/emulated/0/Download/test.jpg'),
//                width: 120,
//                //fill(全图显示且填充满，图片可能会拉伸)，contain（全图显示但不充满，显示原比例），cover（显示可能拉伸，也可能裁剪，充满）
//                //fitWidth（显示可能拉伸，可能裁剪，宽度充满），fitHeight显示可能拉伸，可能裁剪，高度充满），scaleDown（效果和contain差不多，但是）
//              ),
            ],
          ),
          new Text('网络占位图片CachedNetworkImage：'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  imageUrl,
                  scale: 8.5,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: CachedNetworkImage(
                    width: 120,
                    fit: BoxFit.fitWidth,
                    placeholder: Image(image: AssetImage('images/logo.png')),
                    imageUrl: imageUrl,
                    errorWidget: new Icon(Icons.error),
                  ),
                ),
                new CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  fit: BoxFit.fitWidth,
                  placeholder: CircularProgressIndicator(),
                  errorWidget: new Icon(Icons.error),
                )
              ],
            ),
          ),
          new Text('网络占位图片FadeInImage：'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: new Row(
              children: <Widget>[
                new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl,
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: new FadeInImage.assetNetwork(
                    placeholder: 'images/logo.png',
                    image: imageUrl,
                    width: 120,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          new Text('圆形圆角图片：'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                new ClipOval(
//                  child: Image.network(
//                    imageUrl,
//                    width: 100,
//                    height: 100,
//                    fit: BoxFit.fitHeight,
//                  ),
//                ),
                new CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 50.0,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: ClipOval(
                    child: Image.asset(
                      'images/logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                new Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl),
//                        image: AssetImage('images/icon_main_bg.png'),
                        fit: BoxFit.cover),
                  ),
                ),
//                new ClipRRect(
//                  child: Image.network(
//                    imageUrl,
//                    scale: 8.5,
//                    fit: BoxFit.cover,
//                  ),
//                  borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(20),
//                    topRight: Radius.circular(20),
//                  ),
//                ),
              ],
            ),
          ),
          new Text('颜色混合图片：'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/logo.png',
                  color: Colors.red,
                  colorBlendMode: BlendMode.darken,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Image.network(
                    imageUrl,
                    scale: 8.5,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          new Text('centerSlice图片内部拉伸：'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: new Image.asset(
              'images/logo.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
              centerSlice:
                  new Rect.fromCircle(center: const Offset(20, 20), radius: 1),
            ),
          ),
          new Text('matchTextDirection图片内部方向'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Directionality(
                  textDirection: TextDirection.ltr,
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    matchTextDirection: true,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Image.network(
                      imageUrl,
                      height: 100,
                      matchTextDirection: true,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Text('点击替换图片'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    setState(() {
                      widget.networkImage =
                          new NetworkImage(imageUrl2, scale: 8.5);
                    });
                  },
                  child: Text('点击更换图片'),
                ),
                new Image(
                  gaplessPlayback: false,
                  fit: BoxFit.contain,
                  image: widget.networkImage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
