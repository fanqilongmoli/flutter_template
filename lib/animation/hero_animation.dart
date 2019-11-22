import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

const heroTag = "avatarHeroTag";

/// 类似共享元素
class HeroAnimationPage extends BasePage {
  HeroAnimationPage() : super("HeroAnimation");

  @override
  Widget generateChildren(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Hero(
          tag: heroTag,
          child: Image.asset(
            "assets/images/avatar.jpg",
            width: 80,
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(pageBuilder:
              (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
            return HeroAnimation2Page(animation);
          }));
        },
      ),
    );
  }
}

class HeroAnimation2Page extends BasePage {
  final Animation animation;

  HeroAnimation2Page(this.animation) : super("HeroAnimation2");

  @override
  Widget generateChildren(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Center(
        child: Hero(
          tag: heroTag,
          child: Image.asset("assets/images/avatar.jpg"),
        ),
      ),
    );
  }
}
