import 'package:flutter/foundation.dart';
import '../services/notification_service.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
    
    // Trigger notification on change
    NotificationService.showNotification(
      id: 0,
      title: 'Counter Update',
      body: 'Nilai counter saat ini: $_counter',
    );
  }
}
