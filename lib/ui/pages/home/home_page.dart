import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/ui/pages/home/components/animated_banner.dart';
import 'package:shopping_ui/ui/pages/home/components/custom_search_bar.dart';
import 'package:shopping_ui/ui/pages/home/components/footer.dart';
import 'package:shopping_ui/ui/pages/home/components/top_3_products.dart';
import 'package:shopping_ui/ui/pages/home/components/user_list.dart';
import 'package:shopping_ui/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Center(child: Text('카테고리')),
    Center(child: Text('커뮤니티')),
    Center(child: Text('마이페이지')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOGO',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 12.0,
        shadowColor: Colors.black.withOpacity(0.15),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: '홈',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/search_nav.svg'),
            label: '카테고리',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/community.svg'),
            label: '커뮤니티',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            label: '마이페이지',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        elevation: 8.0,
        indicatorColor: Colors.transparent,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        const CustomSearchBar(),
        const SizedBox(height: 16),
        const AnimatedBanner(),
        const SizedBox(height: 16),
        const TopThreeProducts(),
        Container(
          width: double.infinity,
          height: 16,
          color: AppTheme.whiteColorEE,
        ),
        const UserList(),
        const SizedBox(height: 16),
        const Footer(),
      ],
    );
  }
}
