import 'package:friut_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "fullName": fullName, "email": email};
  }
}
