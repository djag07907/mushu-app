import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mushu_app/profile/model/user_profile.dart';

class UserProfileService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUserProfile(String userId, UserProfile userProfile) async {
    try {
      await _db.collection('users').doc(userId).set(userProfile.toMap());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await _db.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return UserProfile.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
