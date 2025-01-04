import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/domain/models/entities.dart';
import 'package:fitflow/features/profile/presention/view/profile.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:fitflow/features/profile/presention/view/widgets/news_screen_body.dart';
import 'package:fitflow/features/profile/presention/view/workout_page.dart';
import 'package:flutter/material.dart';

class NewsScreenView extends StatefulWidget {
  const NewsScreenView({super.key, this.fitnessData});
  static const String routeName = '/news';
  final FitnessData? fitnessData;
  @override
  State<NewsScreenView> createState() => _NewsScreenViewState();
}

class _NewsScreenViewState extends State<NewsScreenView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    // Initialize the _pages list with the correct widget references
    _pages.add(NewsScreenViewBody(fitnessData: widget.fitnessData!));
    _pages.add(const WorkOutScreen());
    _pages.add(const WorkOutScreen());
    _pages.add(const ProfileScreen());
  }

  final List<String> _titles = [
    'News',
    'Workout',
    'Diet',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imagesNews),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imagesWorkout),
            label: 'workout',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imagesDiet),
            label: 'diet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imagesProfile),
            label: 'profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      appBar: CustomAppBar(
        imagePath: Assets.imagesFitFlowlogo,
        titleText: _titles[_selectedIndex],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
