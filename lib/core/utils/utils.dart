import 'package:intl/intl.dart';

String formatReleaseDate(String releaseDate) {
  DateTime parsedDate = DateTime.parse(releaseDate);
  return DateFormat('MMM dd, yyyy').format(parsedDate);
}

String convertVoteAverageToPercentage(double voteAverage) {
  int percentage = (voteAverage * 10).round();
  return '$percentage%';
}

String getPosterUrl(String posterPath) {
  String posterUrl = "https://image.tmdb.org/t/p/w500/$posterPath";
  return posterUrl;
}

String formatRuntime(int runtimeInMinutes) {
  final hours = runtimeInMinutes ~/ 60; // Integer division to get the hours
  final minutes = runtimeInMinutes % 60; // Modulo to get the remaining minutes

  return '${hours}h:${minutes}m';
}
