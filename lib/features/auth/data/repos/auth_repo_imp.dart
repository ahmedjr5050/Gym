import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitflow/core/errors/exception.dart';
import 'package:fitflow/core/errors/failures.dart';
import 'package:fitflow/core/services/data_service.dart';
import 'package:fitflow/core/services/firebase_auth_services.dart';
import 'package:fitflow/core/utils/backend_endpoint.dart';
import 'package:fitflow/features/auth/data/models/user_model.dart';
import 'package:fitflow/features/auth/domain/entities/user_entitiy.dart';
import 'package:fitflow/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthServices;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImp createUserWithEmailAndPassword : $e.toString()',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما يرجى المحاولة مرة أخرى',
        ),
      );
    }
  }

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImp signInWithEmailAndPassword : $e.toString()',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما يرجى المحاولة مرة أخرى',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);

      await addUserData(user: userEntity);

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await firebaseAuthServices.resetPassword(email);
      log('Password reset link sent to your email');
      log(email);
    } catch (e) {
      log('Exception in AuthRepoImpl resetPassword: $e');
      String errorMessage;
      if (e is CustomException) {
        errorMessage = e.message;
      } else {
        errorMessage = 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى';
      }
      return left(ServerFailure(errorMessage));
    }
    return right(null);
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuthServices.logout();
      log('User logged out successfully');
    } catch (e) {
      log('Exception in AuthRepoImpl.logout: $e');
      throw CustomException(
          message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى');
    }
  }
}
