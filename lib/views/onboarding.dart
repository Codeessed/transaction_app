
import 'dart:async';

import 'package:cashir_app/theme/color.dart';
import 'package:cashir_app/theme/text-styles.dart';
import 'package:cashir_app/views/common/height-spacer.dart';
import 'package:cashir_app/views/sign-up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'common/app-button.dart';
import 'common/width-spacer.dart';


class Onboard extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _OnboardState();
  }

}

class _OnboardState extends State<Onboard> {

  Timer? countdownTimer;
  int index = 0;
  PageController controller = PageController();
  Duration timerDuration = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }


  final onboardingPagesList = [
    PageModel(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            HeightSpacer(0.02),
            Text(
              "Onboarding 1",
              style: headerText2Style,
              textAlign: TextAlign.center,
            ),
            HeightSpacer(0.05),
            Text(
              "This is onboarding  1 welcome description page to enable users feel at home",
              style: bodyText2Style,
              textAlign: TextAlign.center,
            ),
            Spacer()
          ],
        ),
      ),

    ),
    PageModel(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            HeightSpacer(0.02),
            Text(
              "Onboarding 2",
              style: headerText2Style,
              textAlign: TextAlign.center,
            ),
            HeightSpacer(0.05),
            Text(
              "This is onboarding  2 welcome description page to enable users feel at home",
              style: bodyText2Style,
              textAlign: TextAlign.center,
            ),
            Spacer()
          ],
        ),
      ),

    ),

  ];


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: appBackgroundColor,
          body: Center(
            child: Column(
              children: [
                HeightSpacer(0.05),
                index < onboardingPagesList.length - 1 ? Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                              (route) => false
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Text(
                          "Skip",
                          style: bodyText2Style,
                        )
                    ),
                  ),
                ) : Container(),
                Expanded(
                  child:
                  Onboarding(
                    pages: onboardingPagesList,
                    startPageIndex: 0,
                    onPageChange: (int pageIndex) {
                      setState(() {
                        index = pageIndex;
                      });
                    },
                    footerBuilder: (context, dragDistance, pagesLength, setIndex){
                      return Column(
                        children: [
                          HeightSpacer(0.05),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == 0 ? Colors.black : Colors.grey
                                ),
                                height: 10,
                                width: 10,
                              ),
                              WidthSpacer(0.02),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == 1 ? Colors.black : Colors.grey
                                ),
                                height: 10,
                                width: 10,
                              )
                            ],
                            mainAxisSize: MainAxisSize.min,
                          ),
                          HeightSpacer(0.15),
                          index == pagesLength - 1
                              ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AppButton(
                              "Get Started",
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUp()),
                                        (route) => false
                                );
                              },
                            ),
                          ) : Container()
                        ],
                      );
                    },
                  ),
                ),
                HeightSpacer(0.1)
              ],
            ),
          )
      ),
    );
  }
}
