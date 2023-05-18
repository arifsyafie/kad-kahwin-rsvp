class UcapanFormModel {
  String name, dateTime, wish;

  UcapanFormModel({
    required this.name,
    required this.wish,
    required this.dateTime,
  });

  factory UcapanFormModel.fromJson(Map<String, dynamic> json) =>
      UcapanFormModel(
        name: json['name'],
        wish: json['wish'],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() =>
      {'name': name, 'wish': wish, 'dateTime': dateTime};
}
