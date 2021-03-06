// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_font_size.dart';
import 'package:gojek/ui/widgets/card_goclub.dart';
import 'package:gojek/ui/widgets/card_info.dart';
import 'package:gojek/ui/widgets/custom_button_icon.dart';
import 'package:gojek/ui/widgets/custom_card.dart';
import 'package:gojek/ui/widgets/nav_bottom.dart';
import 'package:gojek/ui/widgets/scroll_brush.dart';
import 'package:gojek/ui/widgets/subtitle.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final _ScrollController = ScrollController();
  int tabBarIndex = 0;
  List<bool> tabBarBadgeList = [false, false, false, true];
  List tabBarList = ["Beranda", "Promo", "Pesanan", "Chat"];
  int balanceBalance = 0;
  bool isBrush = false;
  bool isCollapseNavBottom = true;

  @override
  void initState() {
    _ScrollController.addListener(() {
      if (_ScrollController.position.pixels > 0) {
        isBrush = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBarItem(int index) {
      return Expanded(
        child: Stack(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (tabBarIndex == index)
                      ? MyColors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabBarIndex = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      tabBarList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (tabBarIndex == index)
                            ? MyColors.darkGreen
                            : Colors.white,
                        fontSize: MyFontSize.medium1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
            if (tabBarBadgeList[index])
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: MyColors.red,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 1.5,
                        color: MyColors.white,
                      )),
                  child: Center(
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    }

    Widget tabBar() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.darkGreen,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              tabBarItem(0),
              tabBarItem(1),
              tabBarItem(2),
              tabBarItem(3),
            ],
          ),
        ),
      );
    }

    Widget searchBox() {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: MyColors.whiteL2,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1.5, color: MyColors.softGreen)),
              child: Row(
                children: [
                  Icon(Icons.search, color: MyColors.blackText, size: 40),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Cari layanan, makanan, & tujuan",
                      style: TextStyle(
                        color: MyColors.grey,
                        fontSize: MyFontSize.medium2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(
                "https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=399&q=80",
                height: 60,
                width: 60,
                fit: BoxFit.cover),
          )
        ],
      );
    }

    Widget balance() {
      return Container(
        height: 130,
        decoration: BoxDecoration(
            color: MyColors.blue, borderRadius: BorderRadius.circular(30)),
        child: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                2,
                (index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    height: 16,
                    width: 4,
                    decoration: BoxDecoration(
                        color: (balanceBalance == index)
                            ? MyColors.white
                            : MyColors.softGrey,
                        borderRadius: BorderRadius.circular(100))),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 90,
            width: 150,
            decoration: BoxDecoration(
                color: MyColors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("GoPay",
                        style: TextStyle(
                          color: MyColors.blackText,
                          fontSize: MyFontSize.large1,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Saldo masih kosong",
                    style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                    )),
                const SizedBox(height: 8),
                Text("Klik buat isi",
                    style: TextStyle(
                      color: MyColors.green,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: CustomButtonIcon(
              action: () {},
              iconPath: "assets/images/ic_bayar.png",
              text: "Bayar",
              fontColor: MyColors.white,
              height: 35,
              width: 35,
              isBold: true,
            ),
          ),
          Expanded(
            child: CustomButtonIcon(
              action: () {},
              iconPath: "assets/images/ic_topup.png",
              text: "Top Up",
              fontColor: MyColors.white,
              height: 35,
              width: 35,
              isBold: true,
            ),
          ),
          Expanded(
            child: CustomButtonIcon(
              action: () {},
              iconPath: "assets/images/ic_bayar.png",
              text: "Eksplor",
              fontColor: MyColors.white,
              height: 35,
              width: 35,
              isBold: true,
            ),
          ),
          const SizedBox(width: 10),
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.green,
        title: tabBar(),
      ),
      body: Stack(children: [
        ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            searchBox(),
            const SizedBox(height: 20),
            balance(),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CardGoClub()),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Subtitle(
                iconPath: "assets/images/ic_indoshop.png",
                iconText: "GoPayLater",
                subtitle: "Pake GoPayLater di Tokopedia",
                caption:
                    "Belanja & nikmati beragam promo cashback istimewa hingga Rp 1.7 juta untuk-mu~",
              ),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  5,
                  (index) => const CardInfo(
                    imageUrl:
                        "https://lelogama.go-jek.com/cache/5e/6e/5e6ea5074fb50db5c28e29489f064fee.webp",
                    title: "Hadiah dari GoJek buat perjalananmu!",
                    caption:
                        "Nikmatin perjalanan aman dan hemat naik GoJek/GoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Subtitle(
                iconPath: "assets/images/ic_indoride.png",
                iconText: "GoJek",
                subtitle: "Promo Merdeka buat kamu",
                caption:
                    "Ada diskon dari GoJek/GoCar, paket hemat GoSend Instant, dan diskon GoPay di sini!",
                prefWidget: CustomCard(
                  isShadow: false,
                  padding: EdgeInsets.zero,
                  bgColor: MyColors.softGreen,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text("Lihat Semua",
                        style: TextStyle(
                          color: MyColors.darkGreen,
                          fontSize: MyFontSize.medium2,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    5,
                    (index) => const CardInfo(
                          imageUrl:
                              "https://lelogama.go-jek.com/cache/5e/6e/5e6ea5074fb50db5c28e29489f064fee.webp",
                          title: "Bongkar rahasia penjualan barang murah",
                          caption:
                              "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                        )),
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
        if (isBrush)
          const Align(alignment: Alignment.topCenter, child: ScrollBrush()),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy < 0) {
                isCollapseNavBottom = false;
                setState(() {});
              }

              if (details.delta.dy > 0) {
                isCollapseNavBottom = true;
                setState(() {});
              }
            },
            child: NavBottom(
              isCollapse: isCollapseNavBottom,
            ),
          ),
        ),
      ]),
    );
  }
}
