
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, BlocObserver, Change, Transition, BlocBase;

class SimpleBlocObeserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
   debugPrint('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onDone(Bloc bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
  
}