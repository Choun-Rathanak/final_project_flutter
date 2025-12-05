import 'package:uuid/uuid.dart';

class Services {
  static final uuid = Uuid();

  final String serviceId;
  final String roomId;
  final bool electricity;
  final bool water;
  final bool rubbish;
  final bool laundry;
  final bool wifi;
  final DateTime updatedAt;

  Services({
    String? serviceId,
    required this.roomId,
    required this.electricity,
    required this.water,
    required this.rubbish,
    required this.laundry,
    required this.wifi,
    required this.updatedAt,
  }) : serviceId = serviceId ?? uuid.v4();

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'roomId': roomId,
      'electricity': electricity,
      'water': water,
      'rubbish': rubbish,
      'laundry': laundry,
      'wifi': wifi,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      serviceId: map['serviceId'],
      roomId: map['roomId'],
      electricity: map['electricity'] ?? false,
      water: map['water'] ?? false,
      rubbish: map['rubbish'] ?? false,
      laundry: map['laundry'] ?? false,
      wifi: map['wifi'] ?? false,
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Services copyWith({
    String? serviceId,
    String? roomId,
    bool? electricity,
    bool? water,
    bool? rubbish,
    bool? laundry,
    bool? wifi,
    DateTime? updatedAt,
  }) {
    return Services(
      serviceId: serviceId ?? this.serviceId,
      roomId: roomId ?? this.roomId,
      electricity: electricity ?? this.electricity,
      water: water ?? this.water,
      rubbish: rubbish ?? this.rubbish,
      laundry: laundry ?? this.laundry,
      wifi: wifi ?? this.wifi,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
