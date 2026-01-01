class SkilsModel {
  final String title;
  final double precent;
  final bool ismobile;

  SkilsModel({
    required this.ismobile,
    required this.title,
    required this.precent,
  });
}

// ignore: prefer_final_parameters
List<SkilsModel> skills({required bool ismobile}) => [
  SkilsModel(title: "Dart Programming", precent: 0.8, ismobile: ismobile),
  SkilsModel(title: "Flutter Development", precent: 0.75, ismobile: ismobile),
  SkilsModel(title: "Firebase Integration", precent: 0.7, ismobile: ismobile),
  SkilsModel(title: "State Management", precent: 0.85, ismobile: ismobile),
  SkilsModel(title: "Data & APIs", precent: 0.85, ismobile: ismobile),
  SkilsModel(title: "Local Storage", precent: 0.85, ismobile: ismobile),
  SkilsModel(title: "UI/UX Design (Figma)", precent: 0.85, ismobile: ismobile),
  SkilsModel(
    title: "Clean Architecture / MVVM",
    precent: 0.9,
    ismobile: ismobile,
  ),
  SkilsModel(title: "Problem Solving", precent: 0.7, ismobile: ismobile),
  SkilsModel(title: "Version Control (Git)", precent: 0.8, ismobile: ismobile),
];
