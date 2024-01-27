import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  String instructions = '';
  double distance = 0;
  int idx = 0;
  int total_points = 0;
  bool loading = true;
  double volume = 1.0;
  double time_left = 0;
  Map<String, dynamic> selectedShovel = {};
  Map<String, dynamic> selectedDumper = {};
  void setLoading() {
    loading = false;
  }

  void setSelectedShovel(Map<String, dynamic> Shovel) {
    selectedShovel = Shovel;
    notifyListeners();
  }
  void setSelectedDumper(Map<String, dynamic> dumper) {
    selectedDumper = dumper;
    notifyListeners();
  }

  void setVol(double vol) {
    volume = vol;
    notifyListeners();
  }

  void changeIndex(int i, int points) {
    idx = i;
    total_points = points;
    notifyListeners();
  }

  void setInstruction(String i, double t, double d) {
    instructions = i;
    distance = d;
    time_left = t;
    notifyListeners();
  }
}
