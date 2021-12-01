import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_style.dart';
import 'package:gojek/ui/widgets/custom_card.dart';

class CardInfo extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String caption;

  const CardInfo(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CustomCard(
        bgColor: MyColors.white,
        isShadow: true,
        shadowOpacity: .3,
        width: 350,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                child: Image.network(imageUrl,
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: MyStyle.textTitleBlack,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    caption,
                    style: MyStyle.textParagraphBlack,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
