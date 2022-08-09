import 'package:aljosur_center/Layout/aljosur_layout.dart';
import 'package:aljosur_center/constance/constants.dart';
import 'package:aljosur_center/modules/authentication/login/login_screen.dart';
import 'package:aljosur_center/shared/add_course_cubit/cubit.dart';
import 'package:aljosur_center/shared/admin_cubit/cubit.dart';
import 'package:aljosur_center/shared/cubit_app/cubit.dart';
import 'package:aljosur_center/shared/login_cubit/cubit.dart';
import 'package:aljosur_center/shared/register_cubit/cubit.dart';
import 'package:aljosur_center/shared/simple_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:aljosur_center/remote/cach_helper.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print(message.data.toString());
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  token=await FirebaseMessaging.instance.getToken();
  print(token);
  await cachHelper.init();
  // FirebaseMessaging.onMessage.listen((event)
  // {
  //   print(event.data.toString());
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event)
  // {
  //   print(event.data.toString());
  // });

   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
late Widget start;
   uId = cachHelper.getData('uId');
   print(uId);

     if(uId==null)
    {
      start = LoginScreen();
    }
    else {
      start=AljosurLayout();
    }
    BlocOverrides.runZoned(
        () {
      runApp(MyApp(start));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  Widget startApp;

  MyApp(this.startApp);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),BlocProvider(
          create: (context) => AppCubit()..getcourseData()..getUserData(),
        ),BlocProvider(
          create: (context) => RegisterCubit(),
        ),BlocProvider(
          create: (context) => AdminCubit(),
        ),BlocProvider(
          create: (context) => AddCoursesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JusoorOnline',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor('#050640'),
            selectedItemColor: HexColor('#F15A22'),
            unselectedItemColor: Colors.white ,
          ),
          fontFamily: 'IBM',
          buttonTheme: ButtonThemeData(buttonColor: HexColor('#EB4043')),
          appBarTheme:AppBarTheme(backgroundColor:HexColor("#050640"), ),
          primarySwatch: Colors.orange,
        ),
        home: startApp,
      ),
    );
  }
}
//#050640 blue
//#F15A22 orange