import 'package:flutter/widgets.dart';

<<<<<<< Updated upstream


/**
 * Author: xiaojia.dxj
 * Date: 2018/11/22
 * Email: xiaojia.dxj@alibaba-inc.com
 * LastUpdateTime: 2018/11/22
 * LastUpdateBy: xj.deng
 *
 * Describle:Align描述
 */

class AlignAlignment extends StatelessWidget {
  final Alignment status;
  final String dec;

  const AlignAlignment(Alignment this.status, String this.dec) : super();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xffe91e63),
      width: 90.0,
      height: 50.0,
      child: new Align(
        alignment: status,
        child: new Text(
          dec,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }
}

class AlignFactor extends StatelessWidget {
  final Alignment status;
  final double wFactor;
  final double hFactor;
  final String dec;

  const AlignFactor(Alignment this.status, double this.wFactor,
      double this.hFactor, String this.dec)
      : super();

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      color: Color(0xffe91e63),
      child: new Align(
        alignment: status,
        widthFactor: wFactor,
        heightFactor: hFactor,
        child: Container(
          color: Color(0xfff06292),
          width: 100.0,
          height: 50.0,
          child: Text(dec),
        ),
      ),
    );
  }
}