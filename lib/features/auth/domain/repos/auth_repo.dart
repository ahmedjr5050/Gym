import 'package:dartz/dartz.dart';
import 'package:fitflow/core/errors/failures.dart';
import 'package:fitflow/features/auth/domain/entities/user_entitiy.dart';


abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future addUserData({required UserEntity user});
    Future<Either<Failure, void>> resetPassword(String email); 

 
}
