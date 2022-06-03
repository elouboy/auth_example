import 'package:auth_example/exceptions/firestore_exception.dart';
import 'package:auth_example/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");


  Future<void> createUser({required User user}) async {
    try {
      await userCollection.doc(user.id).set(user.toJson());
    } catch (error) {
      throw FirestoreException(
        message: 'Error you can\'t create a User',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({
    required String userId,
  }) async {
    if (userId.isNotEmpty) {
      final userDoc = await userCollection.doc(userId).get();
      if (!userDoc.exists) {
        return null;
      }

      final Map<String, dynamic> userData =
          userDoc.data() as Map<String, dynamic>;

      return User.fromJson(userData);
    } else {
      throw FirestoreException(
          message:
              'The UserId doesn\'t exist');
    }
  }
}