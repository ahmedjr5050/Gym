import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/profile/presention/view/widgets/news_screen_body.dart';
import 'package:flutter/material.dart';

class NewsScreenView extends StatelessWidget {
  const NewsScreenView({super.key});
  static const String routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Assets.imagesLogo,
              height: 80,
              width: 40,
            ),
            SizedBox(width: 50),
            Text(
              'News',
              style: TextStyles.bold18,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: const NewsScreenViewBody(),
    );
  }
}
