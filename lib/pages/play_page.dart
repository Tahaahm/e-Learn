// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learn_second/data/category_scrol.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button_title.dart';
import 'package:e_learn_second/widgets/custom_dgree.dart';
import 'package:e_learn_second/widgets/custom_heading.dart';
import 'package:e_learn_second/widgets/custom_scrolable.dart';
import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Course",
              style: TextStyle(
                color: textBlack,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Let's continue,shall we",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "2 Courses",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spacer,
            ),
            Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryScr.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CutomDgree(
                          imagePath: categoryScr[index]['image'],
                          exp: categoryScr[index]['title'],
                          subtitle: categoryScr[index]['lan'],
                          price: categoryScr[index]['price'],
                          percent: categoryScr[index]['percent'],
                        ),
                      );
                    })))

            //End
          ],
        ),
      ),
    );
  }
}
