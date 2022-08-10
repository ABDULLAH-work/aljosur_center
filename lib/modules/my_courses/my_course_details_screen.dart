import 'package:aljosur_center/shared/cubit_app/cubit.dart';
import 'package:aljosur_center/shared/cubit_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseDetailsScreen extends StatelessWidget {
   const MyCourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>
      (builder:(context, state) {
     return state is AppCubitGetMyCourseDetailsLoadingState ?
     CircularProgressIndicator()
         :Scaffold(
       body: Center(child: Text(AppCubit.get(context).myCourseDetailsModel.linkCourseZoom.toString())),
     );
      },
      listener: (context, state) {},
    );
  }
}
