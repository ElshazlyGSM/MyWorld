
import 'package:flutter/material.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/network/local/cache_helper.dart';
import 'package:mans/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/shop_login_Screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.title, required this.body, required this.image});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 1',
        body: 'On Body 1'),
    BoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 2',
        body: 'On Body 2'),
    BoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 3',
        body: 'On Body 3'),
  ];

  void submit() {
    CacheHelper.saveDate(
      key: 'onBoarding',
      value: true,
    )!.then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int pageNumber) {
                  if (pageNumber == boarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(
                  boarding[index],
                ),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect:  const WormEffect(
                    spacing: 10.0,
                    radius: 10.0,
                    dotWidth: 25.0,
                    dotHeight: 13.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: defaultColor,
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
