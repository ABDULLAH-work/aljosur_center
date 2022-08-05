
import 'package:aljosur_center/shared/login_cubit/cubit.dart';
import 'package:aljosur_center/shared/simple_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print(message.data.toString());
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 // token=await FirebaseMessaging.instance.getToken();
  //print(token);

  FirebaseMessaging.onMessage.listen((event)
  {
    print(event.data.toString());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event)
  {
    print(event.data.toString());
  });



  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);



  // await cachHelper.init();
  // dynamic onBoardingFinish = false;
  // onBoardingFinish = cachHelper.getData('ShowOnBoard');
  //
  // late Widget start;
  // uId = cachHelper.getData('uId');
  // stateUser=cachHelper.getData('state');
  //
  // print(uId);
  // if (onBoardingFinish != null) {
  //   if (uId == null) {
  //     start = SalonOrServicesOrUser();
  //   }
  //   else if(stateUser=='user')
  //   {
  //     start = AzyanLayout();
  //   }
  //   else {
  //     start=SalonDashboardScreen();
  //   }
  // } else {
  //   start = OnBording_Screen();
  // }

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
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Azyan',
        theme: ThemeData(
          fontFamily: 'IBM',
          buttonTheme: ButtonThemeData(buttonColor: HexColor('#EB4043')),
          scaffoldBackgroundColor: HexColor("#FFEBED"),
          appBarTheme:AppBarTheme(backgroundColor:HexColor("#FFEBED"), ),
          primarySwatch: Colors.red,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: HexColor("#FFEBED"),
          ),
        ),
        home: startApp,
      ),
    );
  }
}
