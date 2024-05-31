import 'package:flutter/material.dart';
import 'package:shopping/constants/app_colors.dart';

import '../constants/toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              ToastMessage.snakbar('No Internet Connection', context);
            },
            child: Text('click me')),
      ),
    );
  }
}

