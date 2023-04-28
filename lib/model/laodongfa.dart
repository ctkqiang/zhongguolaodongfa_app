class LaoDongFa {
  String? chapter;
  List<dynamic>? body;

  LaoDongFa({this.chapter, this.body});

  LaoDongFa.fromJson(item)
      : chapter = item["chapter"],
        body = item["body"];

  Map<String, dynamic> toJson() => {"chapter": chapter!, "body": body!};
}
