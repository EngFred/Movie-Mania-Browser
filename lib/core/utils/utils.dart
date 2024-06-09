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

String combineTitleWithReleaseYear(String? title, String? releaseDate) {
  if (title != null && releaseDate != null) {
    final releaseYear = releaseDate.substring(0, 4);
    return "$title ($releaseYear)";
  } else if (title != null && releaseDate == null) {
    return title;
  } else {
    final releaseYear = releaseDate!.substring(0, 4);
    return releaseYear;
  }
}

String getCountryName(String languageCode) {
  switch (languageCode.toLowerCase()) {
    case 'en':
      return 'English';
    case 'es':
      return 'Spanish';
    case 'ja':
      return 'Japanese';
    case 'tr':
      return 'Turkish';
    case 'ko':
      return 'Korean';
    case 'tl':
      return 'Tagalog';
    case 'id':
      return 'Indonesian';
    case 'fr':
      return 'French';
    case 'de':
      return 'German';
    case 'it':
      return 'Italian';
    case 'pt':
      return 'Portuguese';
    case 'ru':
      return 'Russian';
    case 'zh':
      return 'Chinese';
    case 'hi':
      return 'Hindi';
    case 'ar':
      return 'Arabic';
    case 'bn':
      return 'Bengali';
    case 'pa':
      return 'Punjabi';
    case 'jv':
      return 'Javanese';
    case 'ms':
      return 'Malay';
    case 'vi':
      return 'Vietnamese';
    case 'fa':
      return 'Persian';
    case 'ur':
      return 'Urdu';
    case 'gu':
      return 'Gujarati';
    case 'pl':
      return 'Polish';
    case 'uk':
      return 'Ukrainian';
    case 'el':
      return 'Greek';
    case 'ro':
      return 'Romanian';
    case 'hu':
      return 'Hungarian';
    case 'nl':
      return 'Dutch';
    case 'sv':
      return 'Swedish';
    case 'fi':
      return 'Finnish';
    case 'he':
      return 'Hebrew';
    default:
      return 'Unknown';
  }
}
