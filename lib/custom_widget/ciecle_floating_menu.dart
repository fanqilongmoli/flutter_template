import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class FloatingMenuPage extends BasePage {
  FloatingMenuPage() : super("CircleFloatingMenu", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            width: 100,
            height: 100,
            child: CircleFloatingMenu(
              floatingButton: FloatingButton(
                icon: Icons.add,
                size: 30,
                color: Colors.redAccent,
              ),
              subMenus: <Widget>[
                FloatingButton(
                  icon: Icons.widgets,
                ),
                FloatingButton(
                  icon: Icons.book,
                ),
                FloatingButton(
                  icon: Icons.translate,
                ),
                FloatingButton(
                  icon: Icons.alarm_add,
                ),
                FloatingButton(
                  icon: Icons.bluetooth,
                ),
              ],
              startAngle: degToRad(-90.0),
              endAngle: degToRad(90.0),
              menuSelected: (index) {
                showSnackBar(context, 'You choose NO.$index');
              },
            ),
          )
        ],
      ),
    );
  }
}

//=========CircleFloatingMenu===============//
enum MenuState { OPEN, CLOSE }

typedef MenuToggled<state> = void Function(MenuState state);
typedef MenuSelected<index> = void Function(int index);

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);

class CircleFloatingMenu extends StatefulWidget {
  final Widget floatingButton;
  final List<Widget> subMenus;
  final double startAngle;
  final double endAngle;
  final Duration duration;
  final MenuToggled menuToggled;
  final MenuSelected menuSelected;

  CircleFloatingMenu({
    Key key,
    @required this.floatingButton,
    @required this.subMenus,
    this.startAngle = 180 * (pi / 180.0),
    this.endAngle = 270 * (pi / 180.0),
    this.duration = const Duration(milliseconds: 400),
    this.menuToggled,
    this.menuSelected,
  }) : super(key: key);

  @override
  _CircleFloatingMenuState createState() => _CircleFloatingMenuState();
}

class _CircleFloatingMenuState extends State<CircleFloatingMenu>
    with TickerProviderStateMixin {
  final double translateLength = 100;
  MenuState _menuState = MenuState.CLOSE;
  AnimationController _animationController;
  Map<String, Animation<double>> animations;

  @override
  void initState() {
    _animationController = new AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.subMenus.length; i++) {
      Widget sub = Transform.scale(
        scale: animations["scale"].value,
        child: Transform.translate(
          offset: _getOffset(i),
          child: Transform.rotate(
            angle: degToRad(animations["rotate"].value * 360),
            child: GestureDetector(
              child: widget.subMenus[i],
              onTap: () {
                print("onTap");
                if (widget.menuSelected != null) widget.menuSelected(i);
                toggleMenu();
              },
              onPanStart: (_) {
                print('onPanStart');
              },
            ),
          ),
        ),
      );
      widgets.add(sub);
    }
    widgets.add(
      GestureDetector(
        child: widget.floatingButton,
        onTap: toggleMenu,
      ),
    );
    return Stack(alignment: AlignmentDirectional.center, children: widgets);
  }

  void _initAnimation() {
    animations = {
      'scale': _generateScaleAnimation(),
      'rotate': _generateRotateAnimation(),
      'translate': _generateTranslateAnimation(),
    };
  }

  Animation<double> _generateScaleAnimation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.ease)));
  }

  Animation<double> _generateRotateAnimation() {
    return Tween<double>(begin: 0.6, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 1.0, curve: Curves.linear)));
  }

  Animation<double> _generateTranslateAnimation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 1.0, curve: Curves.ease)));
  }

  Offset _getOffset(int index) {
    if (widget.subMenus.length == 0) return Offset(0.0, 0.0);
    if (widget.subMenus.length == 1)
      return Offset(cos(widget.startAngle) * translateLength,
          sin(widget.startAngle) * translateLength);
    double curAngle = (widget.endAngle - widget.startAngle) /
            (widget.subMenus.length - 1) *
            index +
        widget.startAngle;
    return Offset(
        cos(curAngle) * translateLength, sin(curAngle) * translateLength);
  }

  void toggleMenu() {
    if (_animationController.isAnimating) return;
    if (_menuState == MenuState.OPEN) {
      _animationController.animateTo(0.0);
      _menuState = MenuState.CLOSE;
    } else if (_menuState == MenuState.CLOSE) {
      _animationController.forward();
      _menuState = MenuState.OPEN;
    }
    if (widget.menuToggled != null) widget.menuToggled(_menuState);
  }
}

//=================FloatingButton===================//
class FloatingButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final double elevation;

  FloatingButton(
      {Key key, this.icon, this.color, this.size, this.elevation = 2.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Icon(
        icon,
        color: Colors.white,
        size: size ?? 24,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          new BoxShadow(
              color: Colors.grey,
              blurRadius: elevation,
              offset: Offset(elevation, elevation),
              spreadRadius: elevation)
        ],
      ),
    );
  }
}
