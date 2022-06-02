import 'package:auth_example/UI/base/authentication_view_model.dart';
import 'package:auth_example/app/app.locator.dart';
import 'package:auth_example/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import '../UI/login/login.form.dart';


class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: Routes.startupView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateToCreateAccount() =>
      navigationService.navigateTo(Routes.createAccountView);


  @override
  Future authentication() {
    // TODO: implement authentication
    throw UnimplementedError();
  }
}