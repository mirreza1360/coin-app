import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shopping/constants/app_colors.dart';
import 'package:shopping/provider/favoritse_provider.dart';
import 'package:shopping/routes/route_names.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/appbar/custom_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: 0, viewportFraction: 0.95);
    TextEditingController searchController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(size: size),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: AppColors.greyColor),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Ionicons.search_outline,
                        color: AppColors.secondaryColor,
                      ),
                      onPressed: () {},
                    ),
                    fillColor: AppColors.lightColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.greyColor),
                    ),
                  ),
                ),
              ),
              //Begin slider //
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.23,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        allowImplicitScrolling: true,
                        pageSnapping: true,
                        controller: pageController,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.only(right: 5),
                            height: size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/selective.jpg'),
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SmoothPageIndicator(
                          onDotClicked: (index) {},
                          controller: pageController,
                          count: 5,
                          effect: const ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                              activeDotColor: AppColors.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Begin  GridView //
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppTextStyle(
                        title: 'Latest Product',
                        color: AppColors.blackColor,
                        fw: FontWeight.bold,
                        fs: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.latestProduct);
                      },
                      icon: const Icon(
                        Icons.arrow_right_rounded,
                        size: 40,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    return Consumer<FavProvider>(
                      builder: (BuildContext context, FavProvider value,
                          Widget? child) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AppTextStyle(
                                      title: '\$430',
                                      color: AppColors.secondaryColor,
                                      fs: 14,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (value.selectFav.contains(index)) {
                                          value.removeItem(index);
                                        } else {
                                          value.addItem(index);
                                        }
                                      },
                                      icon: Icon(value.selectFav.contains(index)
                                          ? Icons.favorite_border
                                          : Icons.favorite_border_outlined),
                                      color: AppColors.redColor,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
