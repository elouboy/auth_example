import 'package:auth_example/app/app.locator.dart';
import 'package:auth_example/app/app.router.dart';
import 'package:auth_example/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
    final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;

      _navigationService.replaceWith(Routes.homeView);
      // navigate to home view

    } else {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}