// import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/Screens/navigator.dart';
import 'package:first_app/Screens/AuthScreen/login.dart';

class AuthController extends GetxController {
  var loading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> login({required String email, required String password}) async {
    if (email == "" && password == "") {
      Get.snackbar("Failed", "Enter all the required fields",
          backgroundColor: Colors.red);
    }
    else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password).then((value) {
          Get.to(const NavigationPage());
          Get.snackbar("Login Successful", "Welcome Again",
              backgroundColor: Colors.green);
        });
      }
      on FirebaseAuthException catch (ex) {
        Get.snackbar(
            "Invalid", ex.code.toString(), backgroundColor: Colors.red);
      }
    }
  }

  Future<void> register(
      {required String firstName, required String lastName, required String email, required String phoneNumber, required String password, required String confirmPassword}) async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      if (password == confirmPassword) {
        String name = "$firstName $lastName";
        UserCredential? userCredential;
        try {
          userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email, password: password).then((value) {
            Get.off(() => const NavigationPage());
            Get.snackbar("Registration Successful", "Welcome $name!",
                backgroundColor: Colors.green);
          });
        }
        on FirebaseAuthException catch (ex) {
          Get.snackbar("Registration Failed", "Please try again",
              backgroundColor: Colors.red);
        }
      }
    }
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut().then((value) {
      Get.off(() => const LoginScreen());
    });
  }


  Future<void> changePassword(
      {required String currentPassword, required String newPassword, required String confirmNewPassword}) async {
    if (currentPassword.isNotEmpty && newPassword.isNotEmpty &&
        confirmNewPassword.isNotEmpty) {
      if (newPassword == confirmNewPassword) {
        if (newPassword != currentPassword) {
          try {
            User? user = FirebaseAuth.instance.currentUser;

            // Re-authenticate the user
            AuthCredential credential = EmailAuthProvider.credential(
              email: user!.email!,
              password: currentPassword,
            );

            await user.reauthenticateWithCredential(credential);

            // Change password
            await user.updatePassword(newPassword);

            Get.back();
            Get.snackbar("Success", "Password changed successfully",
                backgroundColor: Colors.green);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'wrong-password') {
              Get.snackbar("Failed", "The current password is incorrect",
                  backgroundColor: Colors.red);
            } else {
              Get.snackbar("Failed", e.message ?? "An error occurred",
                  backgroundColor: Colors.red);
            }
          } catch (e) {
            Get.snackbar("Failed", "An unexpected error occurred",
                backgroundColor: Colors.red);
          }
        } else {
          Get.snackbar(
              "Failed", "Current password and new password cannot be the same",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar(
            "Failed", "Please enter the same password in confirm password",
            backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar("Failed", "Enter all the required fields",
          backgroundColor: Colors.red);
    }
  }

  // Future<void> updateProfile({required String name, required String email, required String phoneNumber, required String profileImage}) async {
  //   if (name.isNotEmpty && email.isNotEmpty && phoneNumber.isNotEmpty && profileImage.isNotEmpty) {
  //     http.Response response = await AuthServicesRepo.updateProfile(name, email, phoneNumber, profileImage);
  //     Map responseMap = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       Get.back();
  //       Get.snackbar("Success", responseMap["message"], backgroundColor: Colors.green);
  //     }else{
  //       Get.snackbar("Failed", responseMap["message"], backgroundColor: Colors.red);
  //     }
  //   } else {
  //     Get.snackbar("Failed", 'Enter all the required fields', backgroundColor: Colors.red);
  //   }
  // }

  Future<void> updateProfile(
      {required String name, required String email}) async {
    try {
      User? user = _auth.currentUser;

      // Update display name
      await user!.updateDisplayName(name);

      // Update email
      await user.updateEmail(email);
      Get.back();
      Get.snackbar("Success", "Profile updated successfully",
          backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Failed", e.message ?? "An error occurred",
          backgroundColor: Colors.red);
      print(e);
    } catch (e) {
      Get.snackbar("Failed", "An unexpected error occurred",
          backgroundColor: Colors.red);
      print(e);
    }
  }


  Future<void> forgotPassword({required String email}) async {
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.off(() => const LoginScreen());
        Get.snackbar('Success', 'Password reset email sent',
            backgroundColor: Colors.green);
      }
      on FirebaseAuthException catch (ex) {
        String message = 'An error occurred';
        Get.snackbar('Failed', message, backgroundColor: Colors.red);
      }
    }
    else {
      Get.snackbar(
          'Failed', 'Enter your email address', backgroundColor: Colors.red);
    }
  }
}

