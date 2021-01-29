import 'dart:async';
import 'package:flutter/cupertino.dart';
class StopwatchProvider with ChangeNotifier{
  bool isPlaying=true;
  String stopTimeToDisplay='00:00:00';
  Stopwatch swatch=Stopwatch();
  final duration=const Duration(milliseconds: 1);
  void startTimer(){
    Timer(duration,keepRunning );
  }
  void keepRunning(){
      if(swatch.isRunning){
        startTimer();
      }
      stopTimeToDisplay=swatch.elapsed.inHours.toString().padLeft(2,'0')+ ":" +
                (swatch.elapsed.inMinutes%60).toString().padLeft(2,'0')+":"+
                 (swatch.elapsed.inSeconds%60).toString().padLeft(2,'0');
      notifyListeners();
  }
 void start(){
      startTimer();
      swatch.start();
      notifyListeners();

 }
  void stop(){
      swatch.stop();
      notifyListeners();
  }
  void reset(){
      swatch.stop();
      swatch.reset();
      isPlaying=false;
      notifyListeners();
  }
}