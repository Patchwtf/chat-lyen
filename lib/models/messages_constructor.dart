class Messages_Const {
  final String message;
  final String receptorUid;
  final String remitentUid;
  final DateTime fecha;
  final String? idConversation;

  Messages_Const(
      {this.idConversation,
      required this.message,
      required this.receptorUid,
      required this.remitentUid,
      required this.fecha});
}
