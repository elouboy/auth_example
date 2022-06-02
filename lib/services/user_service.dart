
import 'package:auth_example/app/app.locator.dart';
import 'package:auth_example/models/user.dart';
import 'package:auth_example/services/firestore_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class UserService{

  final _firestoreService = locator<FirestoreService>();
  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();


  User? _currentUser;
  User get currentUser => _currentUser!;
  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;



  

  Future<void> syncUserAccount() async {
  final firebaseUserId =
      _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;


  final userAccount = await _firestoreService.getUser(userId: firebaseUserId);

  if (userAccount != null) {
    _currentUser = userAccount;
  }
  }


/// Syncs the user account if we have one, if we don't we create it
Future<void> syncOrCreateUserAccount({required User user}) async {

  await syncUserAccount();

  if (_currentUser == null) {
    await _firestoreService.createUser(user: user);
    _currentUser = user;
  }
}


Future signOut() async {
    await _firebaseAuthenticationService.logout();
    _navigationService.navigateTo('/');
  
    
  }
}