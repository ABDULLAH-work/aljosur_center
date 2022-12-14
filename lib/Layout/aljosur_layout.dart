import 'package:aljosur_center/shared/cubit_app/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit_app/states.dart';

class AljosurLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onPressed: () {
                   cubit.logOut(context);
                    }
                    ),
              ],
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(color: Colors.black),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  elevation: 10.0,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book_outlined),
                      label: 'دوراتي',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'حسابي',
                    ),
                  ], currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.onChangeScreen(index);
                  },
                ),
              ),
            ),
            body: cubit.screen[cubit.currentIndex],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
