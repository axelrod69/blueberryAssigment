import 'package:another_flushbar/flushbar.dart';
import 'package:blueberry_assignment/utils/commonWidgets/button.dart';
import 'package:blueberry_assignment/viewModel/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/mediaQuery.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void checkInput(var userName, var password, BuildContext context) {
    if (userName.text == '') {
      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: 'Please Enter Email',
        barBlur: 20,
      ).show(context);
    } else if (password.text == '') {
      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: 'Please Enter Password',
        barBlur: 20,
      ).show(context);
    } else {
      Map<String, dynamic> data = {
        'email': userName.text.toString(),
        'password': password.text.toString()
      };
      Provider.of<LoginViewModel>(context, listen: false).login(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
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
          Container(
            width: double.infinity,
            // color: Colors.red,
            height: SizedVariables.getHeight(context) * 0.5.h,
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back!',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 2.h),
                Text('Sign In To Continue',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey, fontSize: 12.sp)),
                SizedBox(height: 2.h),
                Text('Username',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey, fontSize: 16.sp)),
                SizedBox(height: 2.h),
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  height: 10.h,
                  // color: Colors.red,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: _userNameController,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black, fontSize: 14.sp),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text('Password',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey, fontSize: 16.sp)),
                SizedBox(height: 2.h),
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  height: 10.h,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black, fontSize: 14.sp),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                    child: Button(
                        true,
                        () => checkInput(
                            _userNameController, _passwordController, context),
                        5,
                        75)),
                SizedBox(height: 4.h),
                Center(
                  child: Text('Forgot Password?',
                      // textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey, fontSize: 18.sp)),
                ),
                SizedBox(height: 10.h),
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
                      backgroundImage: AssetImage('assets/img/googleLogo.png'),
                    ),
                    SizedBox(width: 2.w),
                    CircleAvatar(
                      radius: 3.h,
                      backgroundColor: Colors.green,
                      backgroundImage:
                          AssetImage('assets/img/linkedInLogo.jpg'),
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.grey, fontSize: 17.sp)),
                    SizedBox(width: 1.w),
                    Text('Sign Up',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 17.sp))
                  ],
                )
              ],
            ),
          ),

          // Container(
          //   width: double.infinity,
          //   // height: 20.h,
          //   color: Colors.yellow,
          // )
        ],
      ),
    );
  }
}
