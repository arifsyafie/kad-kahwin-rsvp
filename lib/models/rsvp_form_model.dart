class RSVPFormModel {
  String name, dateTime;
  int pax;

  RSVPFormModel({
    required this.name,
    required this.pax,
    required this.dateTime,
  });

  factory RSVPFormModel.fromJson(Map<String, dynamic> json) =>
      RSVPFormModel(
        name: json['name'],
        pax: json['pax'],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() =>
      {'name': name, 'pax': pax, 'dateTime': dateTime};
}
