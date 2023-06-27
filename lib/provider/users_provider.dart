import 'dart:math';

import 'package:crud/data/dummy_users.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get getAll {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    final userId = user.id as String;

    if (userId.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(userId, (value) => user);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
        id,
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id);

    notifyListeners();
  }
}
