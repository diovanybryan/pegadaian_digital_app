import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pegadaian_digital/presentation/feature/attendance/attendance_screen.dart';
import 'package:pegadaian_digital/presentation/feature/tasbih/tasbih_screen.dart';

import '../../../../helpers/colors_custom.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({super.key});

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  List<(String image, String title)> menuList = [
    ("assets/images/svg/pawn.svg", "Doa Bepergian"),
    ("assets/images/svg/instalment.svg", "Dzikir"),
    ("assets/images/svg/credit.svg", "Nonton"),
    ("assets/images/svg/gold_plus.svg", "Permainan"),
    ("assets/images/svg/booking.svg", "Booking Service"),
    ("assets/images/svg/pln.svg", "Listrik (PLN)"),
    ("assets/images/svg/gold_bar.svg", "Cicilan Emas Batangan"),
    ("assets/images/svg/menu.svg", "Lihat Semua"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              childAspectRatio: 0.8,
              crossAxisSpacing: 5),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return GestureDetector( // {{ edit_1 }}
              onTap: () {
                if (index == 0) { // Doa Bepergian
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceScreen())); // {{ edit_1 }}
                } else if (index == 1) { // Dzikir
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TasbihScreen())); // {{ edit_1 }}
                }
              },
              child: Container(
                width: 60,
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    SvgPicture.asset(menuList[index].$1),
                    SizedBox(height: 10),
                    Text(
                      menuList[index].$2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: ColorsCustom.black),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
