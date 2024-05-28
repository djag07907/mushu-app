class MedicalRecord {
  String? recordId;
  String? diagnosis;
  String? treatment;
  DateTime? date;
  String? petId;

  MedicalRecord({
    this.recordId,
    this.diagnosis,
    this.treatment,
    this.date,
    this.petId,
  });

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      recordId: map['record_id'],
      diagnosis: map['diagnosis'],
      treatment: map['treatment'],
      date: map['date'].toDate(),
      petId: map['pet_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'record_id': recordId,
      'diagnosis': diagnosis,
      'treatment': treatment,
      'date': date,
      'pet_id': petId,
    };
  }
}
