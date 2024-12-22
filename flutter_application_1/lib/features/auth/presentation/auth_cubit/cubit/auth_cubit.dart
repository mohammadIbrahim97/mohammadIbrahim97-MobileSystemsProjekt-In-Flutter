

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
   String? firstName;
   String? lastName;
   String? emailAddress;
   String? password;
   bool? termsAndConditionsCheckBoxValue = false;
   GlobalKey<FormState> signupFormKey = GlobalKey();
   GlobalKey<FormState> signinFormKey = GlobalKey();

  signUpWithEmailAndPassword(
  
        ) async {
      try {
        emit(SignupLoadingState());
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress!,
          password: password!,
        );
        await addUserProfile();
    emit(SignupSuccessState());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      emit(SignupFailureState(
        errMessage: 'The password provided is too weak.',
      ));
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailureState(
        errMessage: 'The account already exists for that email.',
      ));
    }
  } catch (e) {
    emit(SignupFailureState(errMessage: e.toString()));
  }
    }

  updateTermsAndConditionsCheckBox({required newValue}){
      termsAndConditionsCheckBoxValue = newValue;
      emit(TermsAndConditionState());
  }


  addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      'firstName': firstName,
      'lastName': lastName,
      'email': emailAddress,
    });
  }



  signInWithEmailAndPassword() async {
  try {
    emit(SigninLoadingState());
    if (password != null) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SigninSuccessState());
      } else {
        print('Password cannot be null.');
      }
  } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
            emit(SigninFailureState(errMessage: 'Wrong password provided for that user.'));
      }
    }
    catch (e) {
      emit(SigninFailureState(errMessage: e.toString()));
    }
  }
}