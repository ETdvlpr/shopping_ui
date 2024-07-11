import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/ui/pages/profile/components/image_gallery.dart';
import 'package:shopping_ui/ui/pages/profile/components/reviiews.dart';
import 'package:shopping_ui/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  final int index;

  const ProfilePage({
    super.key,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Column(
          children: [
            Text(
              "랭킹 1위",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
            Text(
              "베스트 리뷰어",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 10.0,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(
                'assets/images/user_${index + 1}.png',
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            const SizedBox(height: 12),
            Text(
              "Name${(index + 1).toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/crown.svg",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  "골드",
                  style: TextStyle(
                    color: AppTheme.goldColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: const Text("조립컴 업체를 운영하며 리뷰를 작성합니다."),
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey[200],
            ),
            Reviews(index: index),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  "“가격 저렴해요”",
                  "“CPU온도 고온”",
                  "“서멀작업 가능해요”",
                  "“게임 잘 돌아가요”",
                  "“발열이 적어요”",
                ].map((comment) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      comment,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            reviewText(
              "멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.",
              "assets/icons/lightning_blue.svg",
            ),
            const SizedBox(height: 18),
            reviewText(
              "3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.",
              "assets/icons/lightning.svg",
            ),
            const SizedBox(height: 20),
            const ImageGallery(images: [
              "product_review_2.png",
              "product_review_3.png",
              "product_review_4.png"
            ]),
            const SizedBox(height: 20),
            const Divider(
              color: AppTheme.whiteColorF0,
              height: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/message.svg",
                    width: 12,
                    height: 12,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "댓글 달기..",
                    style: TextStyle(color: Color(0xFF616161)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewText(String text, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
