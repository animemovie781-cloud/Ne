class Anime {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String language;
  final String year;
  final String quality;
  final List<Episode> episodes;
  final String? trailerUrl;
  final List<String> genres;
  final String status;

  Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.language,
    required this.year,
    required this.quality,
    required this.episodes,
    this.trailerUrl,
    this.genres = const [],
    this.status = 'Ongoing',
  });
}

class Episode {
  final String id;
  final String title;
  final String videoUrl;
  final int episodeNumber;

  Episode({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.episodeNumber,
  });
}
