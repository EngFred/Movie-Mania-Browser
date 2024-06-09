abstract class FutureBaseUsecase<Type, Params> {
  Future<Type> call({Params? params});
}

abstract class StreamBaseUsecase<Type, Params> {
  Stream<Type> call({Params? params});
}
