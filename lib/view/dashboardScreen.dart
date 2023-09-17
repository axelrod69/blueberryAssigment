import 'package:blueberry_assignment/utils/styles/appColor.dart';
import 'package:blueberry_assignment/viewModel/loginViewModel.dart';
import 'package:blueberry_assignment/viewModel/userListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UserListViewModel>(context, listen: false)
        .fetchUsers(context)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserListViewModel>(context).users;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () => Provider.of<LoginViewModel>(context, listen: false)
                  .logout(context),
              child: Icon(Icons.logout, color: AppColors.iconColor))
        ],
        toolbarHeight: 8.h,
        backgroundColor: AppColors.defaultColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list, color: AppColors.iconColor),
            SizedBox(width: 2.w),
            Icon(Icons.grid_3x3, color: AppColors.iconColor)
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
              padding: EdgeInsets.all(4.w),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2.w,
                    crossAxisSpacing: 2.h,
                  ),
                  itemBuilder: (context, index) => Container(
                        width: 10.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.defaultColor,
                          // borderRadius: BorderRadius.circular(2.dp)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10.w,
                            ),
                            SizedBox(height: 1.h),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                  userProvider[index]
                                      .name
                                      .toString(), //How Can I print the names here
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 12.sp)),
                            )
                          ],
                        ),
                      ),
                  itemCount: userProvider.length),
            ),
    );
  }
}
