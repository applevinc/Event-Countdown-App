class Event {
  String _name;
  DateTime _dueDate;
  int _seconds;
  int _minutes;
  int _hours;
  int _days;

  // constructors
  Event();
  Event.secondConst({String name, int days, int hours, int minutes, int seconds}) {
    _name = name;
    _days = days;
    _hours = hours;
    _minutes = minutes;
    _seconds = seconds;
  }

  // setters
  void setEventName(String name) {
    _name = name;
  }

  void setDueDate(DateTime dueDate) {
    _dueDate = dueDate;
  }

  //getters
  String get name => _name.toUpperCase();
  int get days => _days;
  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;
  DateTime get dueDate => _dueDate;

  // methods
  void splitDueDate() {
    Duration timeUntilDue = _dueDate.difference(DateTime.now());

    _days = timeUntilDue.inDays;
    _hours = timeUntilDue.inHours - (_days * 24);
    _minutes = timeUntilDue.inMinutes - (_days * 24 * 60) - (_hours * 60);
    _seconds = timeUntilDue.inSeconds - (_days * 24 * 60 * 60) - (_hours * 60 * 60) - (_minutes * 60);
  }
}
