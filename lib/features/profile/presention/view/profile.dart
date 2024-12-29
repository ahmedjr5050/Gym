import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/presention/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fitflow/features/auth/presention/sigin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomListview(
                imageyurl: Assets.imagesProfileblue,
                text: 'User Profile',
              ),
              SizedBox(height: 12),
              CustomListview(
                imageyurl: Assets.imagesNotificationblue,
                text: 'Notifications',
              ),
              SizedBox(height: 12),
              CustomListview(
                imageyurl: Assets.imagesContactblue,
                text: 'Contact Us',
              ),
              SizedBox(height: 12),
              CustomListview(
                imageyurl: Assets.imagesInternetblue,
                text: 'Our website',
              ),
              SizedBox(height: 12),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      context.read<SignInCubit>().signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignInView.routeName, (route) => false);
                    },
                    child: Text(
                      'Logout',
                      style: TextStyles.bold18.copyWith(
                        color: Color(0xFF007AFF),
                        fontSize: 23,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(290, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListview extends StatelessWidget {
  CustomListview({
    required this.imageyurl,
    required this.text,
    super.key,
  });
  String imageyurl;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 70,
      padding: const EdgeInsets.only(
        top: 18,
        left: 96,
        right: 104,
        bottom: 20,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF007AFF)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageyurl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 25),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF007AFF),
              fontSize: 20,
              fontFamily: 'Roboto Slab',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
