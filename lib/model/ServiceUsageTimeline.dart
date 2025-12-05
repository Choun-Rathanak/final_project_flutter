
import 'package:myapp/model/enum.dart';
import 'package:uuid/uuid.dart';

class ServiceUsageTimeline {
  static final uuid = Uuid();

  final String timelineId;
  final String roomId;
  final ServiceType serviceType;
  final ServiceStatus status;
  final DateTime timestamp;

  ServiceUsageTimeline({
    String? timelineId,
    required this.roomId,
    required this.serviceType,
    required this.status,
    required this.timestamp,
  }) : timelineId = timelineId ?? uuid.v4();

  Map<String, dynamic> toMap() {
    return {
      'timelineId': timelineId,
      'roomId': roomId,
      'serviceType': serviceType.name,
      'status': status.name,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory ServiceUsageTimeline.fromMap(Map<String, dynamic> map) {
    return ServiceUsageTimeline(
      timelineId: map['timelineId'],
      roomId: map['roomId'],
      serviceType: ServiceType.values.firstWhere(
        (e) => e.name == map['serviceType'],
        orElse: () => ServiceType.electricity,
      ),
      status: ServiceStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => ServiceStatus.off,
      ),
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  ServiceUsageTimeline copyWith({
    String? timelineId,
    String? roomId,
    ServiceType? serviceType,
    ServiceStatus? status,
    DateTime? timestamp,
  }) {
    return ServiceUsageTimeline(
      timelineId: timelineId ?? this.timelineId,
      roomId: roomId ?? this.roomId,
      serviceType: serviceType ?? this.serviceType,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
