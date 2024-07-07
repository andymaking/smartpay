class MessageData {
  String? secret;

  MessageData({this.secret});

  MessageData.fromJson(Map<String, dynamic> json) {
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secret'] = this.secret;
    return data;
  }
}