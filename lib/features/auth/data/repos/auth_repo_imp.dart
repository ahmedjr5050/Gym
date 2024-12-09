import 'dart:developer';

import 'package:dartz/dartz.dart';
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

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImp signInWithGoogle : $e.toString()',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما يرجى المحاولة مرة أخرى',
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
}
