import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_ui/ui/pages/profile/profile_page.dart';
import 'package:shopping_ui/utils/constants.dart';

class UserList extends StatelessWidget {
  final int count;

  const UserList({super.key, this.count = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '골드 계급 사용자들이예요',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.greyTextColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '베스트 리뷰어 🏆 Top10',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    //goto profile page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(index: index),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            child: CircleAvatar(
                              radius: 31,
                              backgroundImage: AssetImage(
                                'assets/images/user_${index + 1}.png',
                              ),
                              backgroundColor: Colors.grey.shade200,
                              child: index == 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.amber,
                                          width: 3.0,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          if (index == 0)
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SvgPicture.asset(
                                'assets/icons/crown.svg',
                                width: 16,
                                height: 16,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Name${(index + 1).toString().padLeft(2, '0')}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
