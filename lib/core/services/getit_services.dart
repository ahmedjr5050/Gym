import 'package:fitflow/core/services/data_service.dart';
import 'package:fitflow/core/services/firebase_auth_services.dart';
import 'package:fitflow/core/services/firestore_service.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  // Register AuthRepo and AuthRepoImpl separately if needed
  final authRepoImpl = AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>());
  getIt.registerSingleton<AuthRepo>(authRepoImpl);
  getIt.registerSingleton<AuthRepoImpl>(authRepoImpl);
}
