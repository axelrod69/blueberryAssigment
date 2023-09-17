import 'package:blueberry_assignment/utils/routes/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/commonWidgets/button.dart';
import '../utils/mediaQuery.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  // late double width;

  Future<bool> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (localStorage.getString('token') != null) {
      print('Token Stored ${localStorage.getString('token')}');

      return true;
    } else {
      print('Token Stored ${localStorage.getString('token')}');

      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getToken().then((value) {
      if (value == true) {
        Navigator.of(context).pushNamed(RouteNames.dashboard);
      } else {
        // Navigator.of(context).pushNamed(RouteNames.onBoarding);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                height: SizedVariables.getHeight(context) * 0.01.h,
                // decoration: const BoxDecoration(color: Colors.red),
                padding: EdgeInsets.only(left: 5.w, top: 4.h),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 4.h),
                    SizedBox(width: 2.w),
                    Text('SALES TOP',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 15.sp))
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                // decoration: const BoxDecoration(color: Colors.yellow),
                child: Image.asset('assets/img/assignmentImage.jpg',
                    fit: BoxFit.cover),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                // decoration: const BoxDecoration(color: Colors.green),
                child: Column(
                  children: [
                    Text('Hello!',
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 1.h),
                    Text(
                        'Welcome to Sales TOP. A Platform To \n Manage Real Estate Needs.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.grey, fontSize: 17.sp))
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  // decoration: const BoxDecoration(color: Colors.pink),
                  child: Center(
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Padding(
                                padding: EdgeInsets.only(left: 6.w, right: 2.w),
                                child: Button(
                                    true,
                                    () => Navigator.of(context)
                                        .pushNamed(RouteNames.login),
                                    5,
                                    0))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 6.w),
                                child: Button(false, () {
                                  print('Sign Up Clicked');
                                }, 5, 0)))
                      ],
                    ),
                  ),
                )),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 2.h),
                  // decoration: const BoxDecoration(color: Colors.orange),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Or via social media',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.grey, fontSize: 18.sp)),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 3.h,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/img/facebookLogo.jpg'),
                          ),
                          SizedBox(width: 2.w),
                          CircleAvatar(
                            radius: 3.h,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/img/googleLogo.png'),
                          ),
                          SizedBox(width: 2.w),
                          CircleAvatar(
                            radius: 3.h,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/img/linkedInLogo.jpg'),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
