import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mushu_app/medicalRecords/model/medical_record_model.dart';

class MedicalRecordService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createMedicalRecord(
      String recordId, MedicalRecord medicalRecord) async {
    try {
      await _db
          .collection('medical_records')
          .doc(recordId)
          .set(medicalRecord.toMap());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<List<MedicalRecord>> getMedicalRecords(String petId) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection('medical_records')
          .where('pet_id', isEqualTo: petId)
          .get();
      List<MedicalRecord> medicalRecords = snapshot.docs
          .map((doc) =>
              MedicalRecord.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return medicalRecords;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}
