/* 
  Bu tarz modellemeler yapmak için https://app.quicktype.io/ tool'unu kullanabilirsiniz 
*/
import 'dart:convert';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

String listModelToJson(ListModel data) => json.encode(data.toJson());

class ListModel {
  List<ListElement> list;

  ListModel({
    required this.list,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  String task;

  ListElement({
    required this.task,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        task: json["task"],
      );

  Map<String, dynamic> toJson() => {
        "task": task,
      };
}
