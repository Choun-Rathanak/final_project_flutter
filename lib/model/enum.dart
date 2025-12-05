enum Status { active, expired, other }

enum ServiceType { electricity, water, rubbish, laundry, wifi }

enum ServiceStatus { on, off, update, complete }

enum HistoryActionType {
  paymentAdded,
  serviceUpdated,
  roomDeadlineChanged,
  newTenantAdded,
  roomCardUpdated,
}
