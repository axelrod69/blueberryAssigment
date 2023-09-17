import 'package:blueberry_assignment/utils/styles/buttonColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Button extends StatelessWidget {
  final bool isLogin;
  final Function function;
  final int height;
  final int width;

  Button(this.isLogin, this.function, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.dp),
            border: Border.all(
                color: isLogin == true
                    ? ButtonColors.loginBorder
                    : ButtonColors.signUpBorder),
            color: isLogin == true
                ? ButtonColors.loginButtonColor
                : ButtonColors.signUpButtonColor),
        child: Center(
          child: Text(isLogin == true ? 'Login' : 'Sign Up',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isLogin == true ? Colors.white : Colors.black,
                  fontSize: 15.sp)),
        ),
      ),
    );
  }
}
