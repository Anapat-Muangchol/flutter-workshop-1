// To parse this JSON data, do
//
//     final youtuberResponse = youtuberResponseFromJson(jsonString);

import 'dart:convert';

YoutubeResponse youtubeResponseFromJson(String str) =>
    YoutubeResponse.fromJson(json.decode(str));

String youtuberResponseToJson(YoutubeResponse data) =>
    json.encode(data.toJson());

class YoutubeResponse {
  final List<Youtube> youtubes;
  final bool error;
  final String errorMsg;

  YoutubeResponse({
    required this.youtubes,
    required this.error,
    required this.errorMsg,
  });

  factory YoutubeResponse.fromJson(Map<String, dynamic> json) =>
      YoutubeResponse(
        youtubes: json["youtubes"] == null ? [] : List<Youtube>.from(
                json["youtubes"]!.map((x) => Youtube.fromJson(x))),
        error: json["error"],
        errorMsg: json["error_msg"],
      );

  Map<String, dynamic> toJson() => {
        "youtubes": youtubes == null ? [] : List<dynamic>.from(youtubes.map((x) => x.toJson())),
        "error": error,
        "error_msg": errorMsg,
      };
}

class Youtube {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? avatarImage;
  final String? youtubeImage;

  Youtube({
    this.id,
    this.title,
    this.subtitle,
    this.avatarImage,
    this.youtubeImage,
  });

  factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        avatarImage: json["avatar_image"],
        youtubeImage: json["youtube_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "avatar_image": avatarImage,
        "youtube_image": youtubeImage,
      };
}
