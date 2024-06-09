import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchModeNotifier extends StateNotifier<bool> {
  SearchModeNotifier() : super(false);

  void enableSearchMode() {
    state = true;
  }

  void disableSearchMode() {
    state = false;
  }

  void toggleSearchMode() {
    state = !state;
  }
}
