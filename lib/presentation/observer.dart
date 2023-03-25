import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GeneralObserver<T> extends Observer<T>{
  final Function(T) _func;

  GeneralObserver(this._func);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    // TODO: implement onError
    print(e);
  }

  @override
  void onNext(T? response) {
    // TODO: implement onNext
    _func(response as T);
  }
  
}