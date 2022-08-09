import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BookCourseScreen extends StatelessWidget {
  final String idCourse;
  final String nameCourse;
  const BookCourseScreen({required this.idCourse,required this.nameCourse,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          title:const Text(
            'تأكيد الإشتراك',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: HexColor('#050640'),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.grey),
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
