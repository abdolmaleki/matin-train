class AttachmentModel {
  final AttachmentType type;
  final String address;

  AttachmentModel(
      {required this.type, required this.address});
}

enum AttachmentType { remote, local }
