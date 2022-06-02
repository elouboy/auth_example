import 'package:auth_example/UI/create_account/create_account.dart';
import 'package:auth_example/UI/home_view.dart';
import 'package:auth_example/UI/login/login.dart';
import 'package:auth_example/UI/startup.dart';
import 'package:auth_example/services/analytics_service.dart';
import 'package:auth_example/services/firestore_service.dart';
import 'package:auth_example/services/user_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_crashlytics/stacked_crashlytics.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';



@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: HomeView)

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: CrashlyticsService),
  ]
)
class AppSetup {
}