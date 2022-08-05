import 'package:aljosur_center/modules/home/home_screen.dart';
import 'package:aljosur_center/modules/my_courses/my_courses_screen.dart';
import 'package:aljosur_center/shared/cubit_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/my_account/my_account_screen.dart';

class AppCubit extends Cubit<AppStates> {
   AppCubit():super(AppCubitInitialState());

   static AppCubit get(context) => BlocProvider.of(context);

   int currentIndex = 0;


   List<Widget> screen = [
      HomeScreen(),
      MyCoursesScreen(),
      MyAccountScreen(),
   ];


   List<String> titles = [
      'Home',
      'My Courses',
      'My Account',
   ];

   void onChangeScreen(int index) {
      currentIndex = index;
      emit(AppCubitChangeBottomNavigationState());
   }

}