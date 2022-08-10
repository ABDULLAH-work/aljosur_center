import 'package:aljosur_center/constance/component.dart';
import 'package:aljosur_center/model/book_course_model.dart';
import 'package:aljosur_center/modules/my_courses/my_course_details_screen.dart';
import 'package:aljosur_center/shared/cubit_app/cubit.dart';
import 'package:aljosur_center/shared/cubit_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return Scaffold(
            body:AppCubit.get(context).myBookCoursesModel.length!=0? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),itemBuilder: (context, index) {
                return buildCourses(AppCubit.get(context).myBookCoursesModel[index],context);
              }, separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20.0,
                );
              }, itemCount:AppCubit.get(context).myBookCoursesModel.length),
            ): Center(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                     Icons.my_library_books_outlined,
                    size: 250.0,
                  ),
                  Text('لم يتم الشتراك بالدورات بعد', style:  TextStyle(
                   fontSize: 22.0
                  ),),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {

        },
      ),
    );
  }
}
Widget buildCourses(BookCourseModel model,context){
  return   InkWell(
    child: Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(
              model.imageCourse!,
            ),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 200.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.black.withOpacity(0.7),
              ),
              width: double.infinity,
              child: Text(
                model.nameCourse!,
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: (){

      // if(model.state=='0')
      // {
      //   showToast('الرجاء الانتظار حتى يتم تأكيد طلبك');
      // }
      //  else
      //  {
        PushToNextScreen(context, MyCourseDetailsScreen());
        AppCubit.get(context).getMyCourseDetailsData(model.uIdCourse);
     // }

    },
  );

}