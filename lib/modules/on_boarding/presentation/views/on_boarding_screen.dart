import 'package:cochat/modules/on_boarding/presentation/widgets/helper.dart';
import 'package:cochat/modules/on_boarding/presentation/widgets/page_widget.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ConcentricPageView(
        colors: OnBoardingHelper.pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        // curve: Curves.ease,

        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.arrow_forward_ios,
            size: screenWidth * 0.08,
          ),
        ),
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/Login');
        },
        itemCount: OnBoardingHelper.pages.length,

        itemBuilder: (index) {
          final page = OnBoardingHelper.pages[index % OnBoardingHelper.pages.length];
          return SafeArea(
            child: PageWidget(page: page),
          );
        },
      ),
    );
  }
}
