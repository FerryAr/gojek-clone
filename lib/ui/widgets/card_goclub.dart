import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_style.dart';
import 'package:gojek/ui/widgets/custom_card.dart';

class CardGoClub extends StatelessWidget {
  const CardGoClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      bgColor: MyColors.white,
      isShadow: true,
      shadowOpacity: .5,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/ic_indoclub.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text("GoClub", style: MyStyle.textTitleBlack),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  "Program loyalitasnya GoJek",
                  style: MyStyle.textParagraphBlack,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          CustomCard(
            onTap: () {},
            padding: EdgeInsets.zero,
            bgColor: MyColors.green,
            isShadow: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Ikutan Gratis",
                style: MyStyle.textButtonWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
