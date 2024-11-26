import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../utils/snack_bar.dart';
import '../../../../home_fetcher/presentation/views/home_view.dart';

part 'validation_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(ValidationInitial());


  checkFormValed({formKey, context}) {
    if (formKey.currentState?.validate() == true) {
      emit(ValidationSuccessState());
     // sing in firebase


      Navigator.pushNamed(context, HomeView.id);
      //sing in firebase with email& password


    } else {
      // AppSnackBar.failure(context);
      emit(ValidationFailedState());
    }
  }
   singIn({required String email ,required String password}){
   // FirebaseAuth.instance.singin()
  }
/* create user in fire base */
///////////////////////////////////////////////////////////////////

  createUser(
      {formKey, required String name, required String email, required String password }) {
    if (formKey.currentState!.validate()) {
      emit(UserLoadingState());

      //call create user in firebase
      // FirebaseAuth.instance.CreateUser

      emit(UserSuccessState());
    }
    else {
      emit(UserFailedState())
      ;
    }
  }
}