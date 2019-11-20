import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class BlurPage extends BasePage {
  BlurPage() : super("BlurPage", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/images/avatar.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Center(
                    child: Text("Flutter"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
