import 'package:uuid/uuid.dart';

class Tenant {
  static final uuid = Uuid();

  final String tenantId;
  final String roomId;
  final String name;
  final String phone;
  final String? imageUrl;
  final String? contactInfo;
  final DateTime createdAt;

  Tenant({
    String? tenantId,
    required this.roomId,
    required this.name,
    required this.phone,
    this.imageUrl,
    this.contactInfo,
    required this.createdAt,
  }) : tenantId = tenantId ?? uuid.v4();

  Map<String, dynamic> toMap() {
    return {
      'tenantId': tenantId,
      'roomId': roomId,
      'name': name,
      'phone': phone,
      'imageUrl': imageUrl,
      'contactInfo': contactInfo,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Tenant.fromMap(Map<String, dynamic> map) {
    return Tenant(
      tenantId: map['tenantId'],
      roomId: map['roomId'],
      name: map['name'],
      phone: map['phone'],
      imageUrl: map['imageUrl'],
      contactInfo: map['contactInfo'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Tenant copyWith({
    String? tenantId,
    String? roomId,
    String? name,
    String? phone,
    String? imageUrl,
    String? contactInfo,
    DateTime? createdAt,
  }) {
    return Tenant(
      tenantId: tenantId ?? this.tenantId,
      roomId: roomId ?? this.roomId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      contactInfo: contactInfo ?? this.contactInfo,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
