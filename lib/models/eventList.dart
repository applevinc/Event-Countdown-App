import 'package:countdown_timer/models/event.dart';

class EventList {
  List<Event> events = [];

  List<Event> get eventList => events;

  void add(Event event) {
    events.add(event);
  }

  void delete(int index){
    events.removeAt(index);
  }
}