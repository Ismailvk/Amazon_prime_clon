class Movies {
  final String? title;
  final String? backdropPath;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final num? voteAverage;
  Movies({
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory Movies.fromMap(Map<String, dynamic> json) {
    return Movies(
      title: json['title'] ?? json['name'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? json['first_air_date'],
      voteAverage: json['vote_average'],
    );
  }
}
