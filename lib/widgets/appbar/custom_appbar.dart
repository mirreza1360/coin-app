import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/constants/app_colors.dart';
import 'package:shopping/routes/route_names.dart';
import 'package:unicons/unicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PreferredSize(
        preferredSize: preferredSize,
        child: SizedBox(
          width: double.infinity,
          height: 60,
          // color: AppColors.secondaryColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.favourite);
                },
                icon: const Icon(
                  Ionicons.grid_outline,
                  color: AppColors.secondaryColor,
                ),
              ),
              const Text(
                'Shopping App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.login);
                },
                icon: const Icon(
                  UniconsLine.users_alt,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height);
}
