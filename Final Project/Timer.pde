class Timer {
  int savedTime;
  int interval;
  
  Timer(int _interval) {
    interval = _interval;
    savedTime = millis();
  }
  
  void startTimer() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    int timePassed = millis() - savedTime;
    if (timePassed >= interval) return true;
    else return false;
  }
}
