import 'package:auth_example/UI/base/authentication_view_model.dart';
import 'package:auth_example/app/app.locator.dart';
import 'package:auth_example/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import '../UI/create_account/create_account.form.dart';


class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  CreateAccountViewModel() : super(successRoute: Routes.startupView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() async{
     var result = _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
      return result;

  }
  void navigateBack() => navigationService.back();

    void navigateLogin() =>
      navigationService.navigateTo(Routes.loginView);
  @override
  Future authentication() {
    // TODO: implement authentication
    throw UnimplementedError();
  }

}