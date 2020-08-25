import 'package:flutter/material.dart';

class AnimationsView extends StatefulWidget {
  AnimationsView({Key key}) : super(key: key);

  @override
  _AnimationsViewState createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  bool _flutterLogoSize;
  bool _placeHolderChangeLocation;
  bool _graphic;
  bool _flutterLogoOpacity;

  @override
  void initState() {
    super.initState();
    _flutterLogoSize = false;
    _placeHolderChangeLocation = false;
    _graphic = false;
    _flutterLogoOpacity = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // flutter logo default contains animation
            FlutterLogo(
              size: _flutterLogoSize == false ? 100 : 40,
            ),
            Expanded(
              child: AnimatedAlign(
                  alignment: _placeHolderChangeLocation == false
                      ? Alignment.topCenter
                      : Alignment.bottomCenter,
                  duration: Duration(seconds: 1),
                  child:
                      Container(width: 80, height: 80, child: Placeholder())),
            ),
            AnimatedContainer(
              height: _graphic == false ? 30 : 200,
              width: 100,
              color: Colors.red,
              duration: Duration(seconds: 1),
            ),
            AnimatedOpacity(
              opacity: _flutterLogoOpacity == false ? 0.2 : 0.7,
              duration: Duration(milliseconds: 300),
              child: FlutterLogo(size: 150),
            ),
            _buildOutlineButton(
                text: Text("Change Flutter Logo Size"),
                enumState: BOOLSTATES.FLUTTER_LOGO_SIZE),
            _buildOutlineButton(
                text: Text("Change Place Holder Location"),
                enumState: BOOLSTATES.PLACE_HOLDER_CHANGE_LOCATION),
            _buildOutlineButton(
                text: Text("Graphic"), enumState: BOOLSTATES.GRAPHIC),
            _buildOutlineButton(
                text: Text("Change Flutter Logo Opacity"),
                enumState: BOOLSTATES.FLUTTER_LOGO_OPACITY),
          ],
        ),
      ),
    );
  }

  OutlineButton _buildOutlineButton({Text text, BOOLSTATES enumState}) {
    return OutlineButton(
        child: text,
        onPressed: () {
          setState(() {
            _convertorEnumToState(enumState);
          });
        });
  }

  void _convertorEnumToState(BOOLSTATES enumState) {
    switch (enumState) {
      case BOOLSTATES.FLUTTER_LOGO_SIZE:
        setState(() {
          _flutterLogoSize = !_flutterLogoSize;
        });
        break;
      case BOOLSTATES.PLACE_HOLDER_CHANGE_LOCATION:
        setState(() {
          _placeHolderChangeLocation = !_placeHolderChangeLocation;
        });
        break;
      case BOOLSTATES.GRAPHIC:
        setState(() {
          _graphic = !_graphic;
        });
        break;
      case BOOLSTATES.FLUTTER_LOGO_OPACITY:
        setState(() {
          _flutterLogoOpacity = !_flutterLogoOpacity;
        });
        break;
      default:
        print("invalid bool state");
        break;
    }
  }
}

enum BOOLSTATES {
  FLUTTER_LOGO_SIZE,
  PLACE_HOLDER_CHANGE_LOCATION,
  GRAPHIC,
  FLUTTER_LOGO_OPACITY
}
