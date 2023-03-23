import 'dart:convert';

//Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));
String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.adult = false,
    this.backdropPath = "",
    this.id = -1,
    this.title = "",
    this.originalLanguage = "",
    this.originalTitle = "",
    this.overview = "",
    this.posterPath = "",
    this.mediaType = "",
    this.genreIds = const [],
    this.popularity = 0,
    DateTime? releaseDate,
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  }) : this.releaseDate = releaseDate ?? DateTime.now();

  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  DateTime releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  static fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble(),
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
