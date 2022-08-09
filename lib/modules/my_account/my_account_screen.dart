import 'package:aljosur_center/shared/cubit_app/cubit.dart';
import 'package:aljosur_center/shared/cubit_app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          var model = AppCubit.get(context).userModel;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 90.0,
                    backgroundImage: NetworkImage('${model.image}'),
                  ),
                ),
              const   SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    model.name.toString(),
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    10.0,
                  )),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      model.email.toString(),
                    ),
                  ),
                ),
               const  SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    10.0,
                  )),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      model.phone.toString(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
