import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping/provider/counter_provider.dart';
import '../constants/app_colors.dart';

class SingleScreen extends StatelessWidget {
  const SingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          size: 22,
          color: AppColors.secondaryColor,
        ),
        title: const AppTextStyle(
          color: AppColors.secondaryColor,
          fs: 17,
          title: 'All Latest Product',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.26,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/8.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('4.5'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('(1329 reviews)'),
                            const Spacer(),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppColors.redColor),
                                  ),
                                  TextSpan(
                                    text: '210',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppTextStyle(
                              title: 'Title for priduct here',
                              fs: 20,
                              color: AppColors.blackColor,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const AppTextStyle(
                            title: 'Description :',
                            color: AppColors.greyColor,
                            fs: 16),
                        const ReadMoreText(
                          'this title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for productthis title is a description for product',
                          lessStyle: TextStyle(color: AppColors.secondaryColor),
                          moreStyle: TextStyle(color: AppColors.secondaryColor),
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.6,
                          ),
                          trimCollapsedText: ' Show more ',
                          trimExpandedText: '  Show less ',
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.lightColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.secondaryColor,
                              ),
                              child: const Center(
                                child: AppTextStyle(
                                  title: 'Add To Cart',
                                  color: Colors.white,
                                  fs: 20,
                                ),
                              ),
                            ),
                          ),
                          Consumer<CounterProvider>(
                            builder: (BuildContext context, counterProvider,
                                Widget? child) {
                              return Container(
                                  width: 110,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.secondaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          counterProvider.incrementCounter();
                                        },
                                        child: const Text(
                                          '+',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.bgColor),
                                        ),
                                      ),
                                      Text(
                                        counterProvider.counter.toString(),
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.bgColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          counterProvider.decrementCounter();
                                        },
                                        child: const Text(
                                          '—',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.bgColor),
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
