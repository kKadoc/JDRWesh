import 'package:flutter/material.dart';

class PlayerService {
  var list = ["Guillaume", "Sarah", "François", "JC", "Flora", "Matthieu"];

  hasPicture(String player) {
    return list.contains(player);
  }
}
