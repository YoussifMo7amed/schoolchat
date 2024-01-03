class Message{
  final String message;
  final String Id;

  Message( {required this.message,required this.Id});
factory Message.fromjson(jsondata){
  return Message(message: jsondata['message'],Id: jsondata['Id']);
}
}