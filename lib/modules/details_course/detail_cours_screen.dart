import 'package:aljosur_center/constance/component.dart';
import 'package:aljosur_center/model/add_course_model.dart';
import 'package:aljosur_center/modules/book_course/book_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailCourseScreen extends StatelessWidget {
  final AddCourseModel model;
  final id;

  const DetailCourseScreen({Key? key, required this.model, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'معلومات الدورة',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: HexColor('#050640'),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Image(
                  fit: BoxFit.fill,
                  height: 300.0,
                  width: double.infinity,
                  image: NetworkImage(
                    '${model.image}',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${model.nameCourse}',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'عن الدورة',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Text(
                      '${model.description}',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: 1,
                ),
                Text(
                  'عدد الجلسات',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Text(
                      '${model.countSession}',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: 1,
                ),
                Text(
                  'عدد الساعات',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Text(
                      '${model.countHours}',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: 1,
                ),
                Text(
                  'تاريخ البدء',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Text(
                      '${model.dateCourse}',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: 1,
                ),
                Text(
                  'سعر الدورة',
                  style: TextStyle(
                      color: HexColor('#F15A22'),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Text(
                      '${model.priceCourse} ل.س',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: 1,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: customBottom(
          width: double.infinity,
          height: 50.0,
          color: HexColor('#050640'),
          onPressed: () {
            PushToNextScreen(context, BookCourseScreen( idCourse: id.toString(),nameCourse: model.nameCourse.toString(),));
          },
          widget: Text(
            'اشتراك',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          borderColor: HexColor('#050640'),
        ),
      ),
    );
  }
}
