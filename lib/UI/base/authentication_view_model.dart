
import 'package:auth_example/app/app.locator.dart';
import 'package:auth_example/exceptions/firestore_exception.dart';
import 'package:auth_example/models/user.dart';
import 'package:auth_example/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    // Run the authentication and set viewmodel to busy
    try {
      final result = await runBusyFuture(
        runAuthentication(),
        throwException: true,
      );

      await _handleAuthenticationResponse(result);
    } on FirestoreException catch (e) {
      setValidationMessage(e.toString());
    }
  }

  /// Checks if the result has an error. If it doesn't we navigate to the success view
  /// else we show the friendly validation message.
  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user!;

      await userService.syncOrCreateUserAccount(
        user: User(
          id: user.uid,
          email: user.email,
        ),
      );
      // navigate to success route
      navigationService.replaceWith(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {}

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }

  Future changeData() async {
    await runBusyFuture(authentication());
    navigationService.replaceWith(successRoute);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();
  Future authentication();
}
