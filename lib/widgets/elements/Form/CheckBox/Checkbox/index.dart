/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: Checkbox 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/Checkbox-class.html
 */
import '../../../../../common/widget-demo.dart';
import '../../../../../routers/application.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as checkbox;

const String _checkboxTitle =
    'Outline button 示例';

const String _checkboxText0 =
"""### **简介**
> Outline button “边框按钮”
- RaisedButton和FlatButton之间的交叉：一个有边框的按钮，当按下按钮时，其高度增加，背景变得不透明。。
- 高程最初为0.0，其背景颜色 为透明。按下按钮时，其背景变为不透明，然后其高程增加到highlightElevation。
""";

const String _checkboxText1 =
"""### **默认 Checkbox**
> 参数的默认的按钮和禁用按钮
- 如果onPressed回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按 disabledColor 属性而不是color属性指定的颜色进行着色。
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序。""";


const String _checkboxText2 =
"""### **默认 Checkbox.icon**
> 按钮图标和标签的小部件创建文本按钮。""";

const String _checkboxText3 =
"""### **自定义 Checkbox**
> 更改项参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等
- Outline buttons 按钮有一个边框，其形状由形状定义 ，其外观由borderSide，disabledBorderColor和highlightedBorderColor定义。
- 如果您想要水龙头的墨水效果，但又不想使用按钮，请考虑直接使用InkWell。
- Outline buttons 的最小尺寸为88.0×36.0，可以用ButtonTheme 覆盖。
- 通过 shape 属性的设置，改变边框样式和圆角。
- 可以尝试长按按钮，按钮突出显示。
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/CheckBox/Checkbox';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType(){
    String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    this.setState((){
      buttonShapeType = _buttonShapeType;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Checkbox',
      desc: _checkboxTitle,
      codeUrl: '${Application.github['widgetsURL']}elements/Form/Checkbox/Checkbox/demo.dart',
      child: allCheckboxs(context,this),
      docUrl: 'https://docs.flutter.io/flutter/material/Checkbox-class.html',
    );
  }
}

/**
 * 所有的 Checkbox 按钮
 */
Widget allCheckboxs(BuildContext context,_DemoState that){
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _checkboxText0),
            textAlignBar(_checkboxText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                checkbox.CheckboxDefault(context.widget,that),
              ],
            ),
            SizedBox(width: 20.0), // 间距
            textAlignBar(_checkboxText2),
            textAlignBar(_checkboxText3),
            SizedBox(height: 10.0),
            SizedBox(height: 20.0)
          ])
  );
}

/*
  * alert 弹框
  * context:容器的父级
  * */
void _showMessage(String name, BuildContext context) {
  showDialog(
    // alert 的父级
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: new Text('提示'),
          content: new Text(name),
          actions: <Widget>[
            new FlatButton(
              // alert 的取消按钮
                onPressed: () {
                  // 取消的事件
                  Navigator.of(context).pop(true);
                },
                child: new Text('取消'))
          ]);
    }
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt){
  //style: new TextStyle(fontSize: 15.5, height: 1.2),textAlign:TextAlign.left
  return new Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
            //new Text(txt, style: new TextStyle(fontSize: 15.5,height: 1.2,color:Colors.blue),textAlign:TextAlign.left)
          ])
  );
}

/*
* 绘制边框信息,比如是否有边框,是否是圆角
* */
ShapeBorder drawShape(String type){
  final Color _color = _randomColor();
  final borderWidth = Random.secure().nextInt(5).toDouble();
  final radiusWidth = Random.secure().nextInt(50).toDouble();

  switch(type){
    case 'border':
      return Border.all(
        // 设置边框样式
        width: borderWidth,
        color: _color,
        style: BorderStyle.solid,
      );
      break;
    case 'radius':
      return RoundedRectangleBorder(
        side:new BorderSide( // 保留原来的边框样式
          width: borderWidth,
          color: _color,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radiusWidth),
          topLeft: Radius.circular(radiusWidth),
          bottomLeft: Radius.circular(radiusWidth),
          bottomRight: Radius.circular(radiusWidth),
        ),
      );
      break;
    default:
      return null;
  }
}

/*
* 取随机颜色
* */
Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}
