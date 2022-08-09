import 'package:aljosur_center/shared/admin_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminStates>{

  AdminCubit():super(InitialAdminState());

}