sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Error<String> extends Result<String> {
  final String error;
  Error(this.error);
}
