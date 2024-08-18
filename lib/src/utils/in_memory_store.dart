import 'package:rxdart/rxdart.dart';

// An in-memory store backed by BehavioralSubject that can be used to store the values
// of all the fake repositories of the app

class InMemoryStore<T> {
  InMemoryStore(T initialValue)
      : _subject = BehaviorSubject.seeded(initialValue);

  // The behavioral subject that holds the data
  final BehaviorSubject<T> _subject;

  // The output stream that can be used to listen to the data
  Stream<T> get stream => _subject.stream;

  // A syncronous getter for the current value
  T get value => _subject.value;

  // A syncronous setter for updating the value
  set value(T value) => _subject.add(value);

  // Do not forget to call this method when done
  void close() => _subject.close();
}
