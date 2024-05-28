class UserProfile {
  String? userId;
  String? username;
  String? gender;
  String? contactInfo;
  String? profileImageUrl;

  UserProfile({
    this.userId,
    this.username,
    this.gender,
    this.contactInfo,
    this.profileImageUrl,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userId: map['user_id'],
      username: map['username'],
      gender: map['gender'],
      contactInfo: map['contact_info'],
      profileImageUrl: map['profile_image_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'username': username,
      'gender': gender,
      'contact_info': contactInfo,
      'profile_image_url': profileImageUrl,
    };
  }
}
