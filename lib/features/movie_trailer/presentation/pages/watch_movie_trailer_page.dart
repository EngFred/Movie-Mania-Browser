import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/widgets/error_indicator.dart';
import 'package:my_movie_box/core/widgets/loading_indicator.dart';
import 'package:my_movie_box/features/movie_trailer/presentation/provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/constants/constants.dart';

class WatchMovieTrailerPage extends ConsumerStatefulWidget {
  final int movieId;
  const WatchMovieTrailerPage(this.movieId, {super.key});

  @override
  ConsumerState<WatchMovieTrailerPage> createState() =>
      _WatchMovieTrailerPageState();
}

class _WatchMovieTrailerPageState extends ConsumerState<WatchMovieTrailerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(getMovieTrailerUsecaseProvider(widget.movieId)).when(
          data: (trailer) {
        Logger().t(
            "Trailer for movie with id=${widget.movieId} youtube url: $youtubeBaseUrl=${trailer?.key}");
        Logger().i("${trailer}");

        if (trailer == null) {
          return const Center(
            child: Text("The trailer was not found!"),
          );
        }

        _controller = YoutubePlayerController(
          initialVideoId: trailer.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );

        return YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        );
      }, error: (err, stk) {
        return ErrorIndicator(errMsg: errorMsg, onRetry: () {});
      }, loading: () {
        return const LoadingIndicator();
      }),
    );
  }
}
