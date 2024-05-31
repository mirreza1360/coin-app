import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/constants/app_colors.dart';
import 'package:shopping/provider/favoritse_provider.dart';
import '../routes/route_names.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favprovider = Provider.of<FavProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: AppColors.redColor,
          )
        ],
        iconTheme: const IconThemeData(
          size: 22,
          color: AppColors.secondaryColor,
        ),
        title: const AppTextStyle(
          title: 'Favourite Product',
          color: AppColors.blackColor,
          fs: 17,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: favprovider.selectFav.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.single);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppTextStyle(
                                  title: '\$430',
                                  color: AppColors.secondaryColor,
                                  fs: 14,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                  color: AppColors.redColor,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/8.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Blue watch Color',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greyColor,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 200,
              //         height: 200,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image:
              //                   AssetImage('assets/images/matey-welcome-2.png'),
              //               fit: BoxFit.fill),
              //         ),
              //       ),
              //       AppTextStyle(
              //           title: 'No Favourites',
              //           color: AppColors.blackColor,
              //           fs: 18)
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
