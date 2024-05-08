export 'album_data.dart';

class Albums {
  Albums({
    required this.host,
    required this.data,
  });

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      host: json['host'] as String,
      data: (json['data'] as List)
          .map((data) => Album.fromJson(data as Map<String, dynamic>))
          .toList(),
    );
  }
  String host;
  List<Album> data;
}

class Album {
  Album({
    required this.title,
    required this.name,
    required this.link,
    required this.date,
    required this.images,
    this.host = '',
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'] as String,
      name: json['name'] as String,
      link: json['link'] as String,
      date: json['date'] as String,
      images: List<String>.from(json['images'] as List<dynamic>),
    );
  }
  String title;
  String name;
  String link;
  String date;
  String host;
  List<String> images;
}
