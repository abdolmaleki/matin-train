class TicketModel {
  int? id;
  List<String>? attachments;
  int? departmentId;
  String? description;
  String? priority;
  String? title;
  int? userId;
  List<TicketMessage>? messages;
  DateTime? createDate;
  TicketStatus status;
  String? receiver;
  TicketReceiverType? receiverType;

  TicketModel(
      {this.attachments,
      this.departmentId,
      this.description,
      this.priority,
      this.id,
      this.messages,
      this.title,
      this.userId,
      this.createDate,
      this.status = TicketStatus.waiting,
      this.receiver,
      this.receiverType});
}

class TicketMessage {
  final int sequenceId;
  final int userId;
  final String message;
  final String name;
  final String avatar;
  final DateTime date;

  TicketMessage(
      {required this.sequenceId,
      required this.userId,
      required this.message,
      required this.name,
      required this.avatar,
      required this.date});
}

enum TicketStatus { waiting, closed }

enum TicketReceiverType { staff, customer, department }
