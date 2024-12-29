import 'package:dio/dio.dart';
import 'package:fitflow/core/services/data_service.dart';
import 'package:fitflow/core/services/firebase_auth_services.dart';
import 'package:fitflow/core/services/firestore_service.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/domain/repos/auth_repo.dart';
import 'package:fitflow/features/profile/data/repo/repo_impl.dart';
import 'package:fitflow/features/profile/domain/repo/fitness_data_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // Ensure FirebaseAuthService is registered before using it in AuthRepoImpl
  if (!getIt.isRegistered<FirebaseAuthService>()) {
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  }

  // Ensure DatabaseService (Firestore) is registered
  if (!getIt.isRegistered<DatabaseService>()) {
    getIt.registerSingleton<DatabaseService>(FireStoreService());
  }

  // Register Dio instance
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerSingleton<Dio>(Dio());
  }

  // Register AuthRepoImpl and its interface
  if (!getIt.isRegistered<AuthRepoImpl>()) {
    final authRepoImpl = AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    );
    getIt.registerSingleton<AuthRepoImpl>(authRepoImpl);
    getIt.registerSingleton<AuthRepo>(authRepoImpl);
  }

  // Register FitnessDataRepository
  if (!getIt.isRegistered<FitnessDataRepository>()) {
    getIt.registerSingleton<FitnessDataRepository>(
      FitnessDataRepositoryImpl(getIt<Dio>()),
    );
  }
}
