import 'package:flutter/material.dart';

class CustomPlayPauseButton extends StatefulWidget {
  var funcOne;
  var funcTwo;
  var icon1;
  var icon2;
  CustomPlayPauseButton({this.funcOne,this.funcTwo,this.icon1,this.icon2});

  @override
  _CustomPlayPauseButtonState createState() => _CustomPlayPauseButtonState();
}

class _CustomPlayPauseButtonState extends State<CustomPlayPauseButton> {
  bool bValue=false;
  handlePress(){
    if(bValue){
      widget.funcOne();
    }
    else{
      widget.funcTwo();
    }
    setState(() {
      bValue=!bValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
     FlatButton(shape: CircleBorder(),
     color: Colors.deepOrangeAccent,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Icon(bValue?widget.icon1:widget.icon2,
       color: Colors.white,
       size: 40,
       ),
     ),
     onPressed: (){
       handlePress();;
     },);
  }
}
class CustomSpeedController extends StatefulWidget {
    var func;
    int def;
  CustomSpeedController({this.func,this.def});

  @override
  _CustomSpeedControllerState createState() => _CustomSpeedControllerState();
}

class _CustomSpeedControllerState extends State<CustomSpeedController> {
 List<double> speedArr=[0.25,0.5,0.75,1.00,1.25,1.75,2.00];
 int speed=3;
 handlePress(){
    var upSpeed= (speed+1)%speedArr.length;
    print(upSpeed);
    widget.func(speedArr[upSpeed]);
    setState(() {
      speed= upSpeed;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(child: Text(speedArr[speed].toString(),
    style: TextStyle(color: Colors.white),),
    onPressed: handlePress,
    color: Colors.deepOrangeAccent
    );
  }
}