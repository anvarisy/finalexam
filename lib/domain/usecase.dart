
import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GeneralUseCase<Response, Params> extends UseCase<Response, Params>{
  final Future<Response> Function(Params function) _function;

  GeneralUseCase(this._function);

  @override
  Future<Stream<Response>> buildUseCaseStream(Params? params) async {
    final controller = StreamController<Response>();
    try {
      Response response = await _function(params as Params);
      controller.add(response);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
  
}