import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_memory_game/components/gradient_widget.dart';
import 'package:flutter_memory_game/core/extensions/context_extensions.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.mediaQuery.size.height;
    final screenWidth = context.mediaQuery.size.width;
    return BackdropFilter(
      blendMode: BlendMode.colorDodge,
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), //add blur
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight / 8,
                width: screenWidth / 1.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.indigo,
                ),
                child: const Center(
                  child: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Container(
                  height: screenHeight / 3,
                  width: screenWidth / 1.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Column(
                              children: [
                                gradientThreeStarXd(context),
                                Text("OPEN"),
                                Text("         4        "),
                                GradientWidget(
                                    gradient: LinearGradient(
                                        colors: [Colors.white, Colors.yellow]),
                                    widget: Icon(Icons.star)),
                                Text("         4        "),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: gradientThreeStarXd(
                                        context,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("open : 5 "),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: gradientTwoStarXd(
                                            context,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("open : 7 "),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: gradientStarWidget(
                                            context,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("open : - "),
                                        ),
                                      ],
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: alertBtn1(context)),
                                Expanded(child: alertBtn1(context)),
                                Expanded(child: alertBtn1(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton alertBtn1(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.transparent;
            }
            if (states.contains(MaterialState.pressed)) {
              return Colors.transparent;
            }
            return null;
          },
        ),
      ),
      onPressed: () {},
      // ignore: prefer_const_constructors
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.dynamicHeight(0.01),
          horizontal: context.dynamicWidth(0.014),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.withOpacity(0.5),
              Colors.deepPurpleAccent.withOpacity(0.5),
              Colors.deepPurpleAccent.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(
              context.dynamicHeight(0.005) * context.dynamicWidth(0.008)),
        ),
        child: GradientWidget(
          gradient: const SweepGradient(
            colors: [
              Color(0xFF9400D3),
              Color(0xFF4B0082),
              Color(0xFF0000FF),
              Color(0xFF00FF00),
              Color(0xFFFFFF00),
              Color(0xFFFF7F00),
              Color(0xFFFF0000),
            ],
            startAngle: 0.9,
            endAngle: 6.0,
            tileMode: TileMode.clamp,
          ),
          widget: FittedBox(
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                  size:
                      context.dynamicHeight(0.01) * context.dynamicWidth(0.014),
                ),
                Text(
                  "MENU",
                  style: TextStyle(
                    fontSize: context.dynamicHeight(0.01) *
                        context.dynamicWidth(0.014),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Wrap gradientThreeStarXd(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 2,
      children: [
        gradientStarWidget(context),
        gradientStarWidget(context),
        gradientStarWidget(context),
      ],
    );
  }

  Wrap gradientTwoStarXd(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 2,
      children: [
        gradientStarWidget(context),
        gradientStarWidget(context),
        gradientStarWidget(context),
      ],
    );
  }

  FittedBox gradientStarWidget(BuildContext context) {
    // ignore: prefer_const_constructors
    return FittedBox(
      // ignore: prefer_const_constructors
      child: GradientWidget(
        // ignore: prefer_const_constructors
        gradient: const RadialGradient(
          colors: [
            Color(0xFF9400D3),
            Color(0xFF4B0082),
            Color(0xFF0000FF),
            Color(0xFF00FF00),
            Color(0xFFFFFF00),
            Color(0xFFFF7F00),
            Color(0xFFFF0000),
          ],
          center: Alignment(0.0, 0.5),
          tileMode: TileMode.clamp,
        ),

        widget: Icon(
          Icons.star,
          size: context.dynamicHeight(0.01) * context.dynamicWidth(0.014),
        ),
      ),
    );
  }
}