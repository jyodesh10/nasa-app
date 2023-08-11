// To parse this JSON data, do
//
//     final apodModel = apodModelFromJson(jsonString);

import 'dart:convert';

ApodModel apodModelFromJson(String str) => ApodModel.fromJson(json.decode(str));

String apodModelToJson(ApodModel data) => json.encode(data.toJson());

class ApodModel {
    String copyright;
    DateTime date;
    String explanation;
    String hdurl;
    String mediaType;
    String serviceVersion;
    String title;
    String url;

    ApodModel({
        required this.copyright,
        required this.date,
        required this.explanation,
        required this.hdurl,
        required this.mediaType,
        required this.serviceVersion,
        required this.title,
        required this.url,
    });

    factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
    };
}
