import 'package:aljosur_center/constance/component.dart';
import 'package:aljosur_center/constance/constants.dart';
import 'package:aljosur_center/modules/authentication/login/login_screen.dart';
import 'package:aljosur_center/modules/home/home_screen.dart';
import 'package:aljosur_center/modules/my_courses/my_courses_screen.dart';
import 'package:aljosur_center/shared/cubit_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aljosur_center/remote/cach_helper.dart';
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
      'الرئيسية',
      'دوراتي',
      'حسابي',
   ];

   void onChangeScreen(int index) {
      currentIndex = index;
      emit(AppCubitChangeBottomNavigationState());
   }

   void logOut(context) {
      cachHelper.removeData('uId');
      print(uId);
      navigatorAndFinish(context, LoginScreen());
      emit(AppCubitLogOutState());
   }

}