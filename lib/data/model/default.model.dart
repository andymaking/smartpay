import 'dart:convert';

ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));
String resModelToJson(ResModel data) => json.encode(data.toJson());

String resModelDataToString(dynamic data) => json.encode(data);
dynamic resModelDataToJson(String data) => json.decode(data);

class ResModel {
  String? message;
  bool? status;
  dynamic data;
  List<Null>? meta;
  dynamic errors;

  ResModel({this.message, this.status, this.data, this.meta, this.errors});

  ResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json["data"];
    if (json['meta'] != null) {
      meta = <Null>[];
      json['meta'].forEach((v) {
        // meta!.add(new Null.fromJson(v));
      });
    }
    errors =
    json['errors'] != json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.meta != null) {
      // data['meta'] = this.meta!.map((v) => v.toJson()).toList();
    }
    data['errors'] = errors;
    data['data'] = data;
    return data;
  }
}


