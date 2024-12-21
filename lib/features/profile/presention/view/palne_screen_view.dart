import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:fitflow/features/profile/presention/view/widgets/plane_screen_view_body.dart';
import 'package:flutter/material.dart';

class PlaneScreen extends StatelessWidget {
  const PlaneScreen({super.key});
  static const routeName = '/plane-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          imagePath: Assets.imagesFitFlowlogo,
          titleText: 'Your Plane',
          size: 28),
      body: PlaneScreeenViewBody(),
    );
  }
}
