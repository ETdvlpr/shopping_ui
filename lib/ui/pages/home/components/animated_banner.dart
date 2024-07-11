import 'package:flutter/material.dart';

class AnimatedBanner extends StatefulWidget {
  const AnimatedBanner({super.key});

  @override
  _AnimatedBannerState createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  int banners = 4;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    _pageController.addListener(() {
      if (_pageController.page!.round() == banners - 1) {
        _pageController.jumpToPage(0);
      }
    });
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), _switchPage);
  }

  void _switchPage() {
    if (_pageController.hasClients) {
      setState(() {
        _currentPage = (_currentPage + 1) % 4;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 221,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) => _buildBannerImage(
              'assets/images/banner_${index + 1}.png',
            ),
            itemCount: banners,
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                width: _currentPage == index ? 9 : 4,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: _currentPage == index ? Colors.white : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerImage(String assetPath) {
    return Image.asset(
      assetPath,
      fit: BoxFit.fitWidth,
    );
  }
}
