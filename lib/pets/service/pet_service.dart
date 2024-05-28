import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mushu_app/pets/model/pet_model.dart';

class PetService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createPet(String petId, Pet pet) async {
    try {
      await _db.collection('pets').doc(petId).set(pet.toMap());
    } catch (e) {
      print(e);
    }
  }

  Future<Pet?> getPet(String petId) async {
    try {
      DocumentSnapshot snapshot = await _db.collection('pets').doc(petId).get();
      if (snapshot.exists) {
        return Pet.fromMap(snapshot.data() as Map<String, dynamic>);
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
