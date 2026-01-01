import 'package:flutter/material.dart';

class SoftSkils {
  final String test;
  final IconData icon;

  SoftSkils({required this.test, required this.icon});
}

List<SoftSkils> softskils = [
  SoftSkils(test: "Leadership", icon: Icons.donut_large_sharp),
  SoftSkils(test: "Teamwork", icon: Icons.groups),
  SoftSkils(test: "Problem Solving", icon: Icons.lightbulb),
  SoftSkils(test: "Creativity", icon: Icons.tips_and_updates),
  SoftSkils(test: "Communication", icon: Icons.chat),
  SoftSkils(test: "Innovation", icon: Icons.auto_awesome),
];
