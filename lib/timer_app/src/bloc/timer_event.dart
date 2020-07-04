export 'timer_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({@required this.duration});

  @override
  String toString() {
    return 'TimerStarted { duration: $duration }';
  }
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() {
    return 'TimerTicked { duration: $duration }';
  }
}
