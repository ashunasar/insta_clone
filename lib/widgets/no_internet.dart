import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add your customized no internet connection screen
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_wifi.png'),
          SizedBox(height: 40.h),
          Text(
            'No Internet Connection',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 40.h),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
          SizedBox(height: 10.h),
          Text(
            'Retrying.....',
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
