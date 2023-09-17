import 'package:blueberry_assignment/utils/routes/routeNames.dart';
import 'package:blueberry_assignment/viewModel/userListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/routes/route.dart';
import 'viewModel/loginViewModel.dart';

void main() => runApp(BlueBerryAssignment());

class BlueBerryAssignment extends StatefulWidget {
  BlueBerryAssignmentState createState() => BlueBerryAssignmentState();
}

class BlueBerryAssignmentState extends State<BlueBerryAssignment> {
  bool? checkToken;

  @override
  void initState() {
    // TODO: implement initState
    // getToken().then((value) {
    //   if (value == true) {
    //     setState(() {
    //       checkToken = true;
    //     });
    //   } else {
    //     setState(() {
    //       checkToken = false;
    //     });
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginViewModel()),
          ChangeNotifierProvider(create: (context) => UserListViewModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                  titleLarge: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                  titleMedium: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold))),
          initialRoute: RouteNames.onBoarding,
          onGenerateRoute: GenerateRoutes.generateRoute,
        ),
      ),
    );
  }
}
