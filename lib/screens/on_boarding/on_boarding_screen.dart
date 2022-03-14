import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/screens/add_account/add_account_screen.dart';
import 'package:task1/screens/home/home_screen.dart';
import 'package:task1/shared/components/components.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 300,
            child: SvgPicture.asset('assets/images/credit_card.svg'),
          ),
          SizedBox(
            height: 15,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Money ',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Credit',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            "A brand new experience of managing\n your business",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 50,
            width: 200,
            child: defaultFloatButton(
              text: 'Get Started Now',
              function: () {
                 navigateAndFinish(context,AddAccountScreen());
              },
              context: context,
            ),
          )
        ],
      ),
    );
  }
}
