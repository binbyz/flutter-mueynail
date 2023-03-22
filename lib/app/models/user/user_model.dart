class UserModel {
  final int id;
  final int state;
  final int ownerShopId;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String? extraData;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.state,
    required this.ownerShopId,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.extraData,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      state: json['state'],
      ownerShopId: json['owner_shop_id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at']) : null,
      extraData: json['extra_data'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}