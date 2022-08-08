import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),itemBuilder: (context, index) {
          return buildCourses();
        }, separatorBuilder: (context, index) {
         return SizedBox(
            height: 20.0,
          );
        }, itemCount: 10),
      ),
    );
  }
}
Widget buildCourses(){
  return   InkWell(
    child: Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(
              'https://i0.wp.com/jusooronline.com/wp-content/uploads/2022/07/%D9%85%D8%AC%D8%A7%D9%86%D9%8A%D8%A9.jpg?w=1000&ssl=1',
            ),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.black.withOpacity(0.7),
              ),
              width: double.infinity,
              child: Text(
                'دورة كيف تبدأ عملاً ناجحا على الانترنت',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: (){},
  );
}