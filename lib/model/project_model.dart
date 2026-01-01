import 'package:portofilo/core/constant/app_iimage.dart';

class ProjectModel {
  final String image;
  final String title1;
  final String title2;
  final String dec;
  final String? github;
  final List<String>? skils;
  ProjectModel({
    required this.title2,
    required this.image,
    required this.title1,
    required this.dec,
    this.github,
    this.skils,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    title2: "_App",
    image: AppIimage.novaFilx,
    title1: "Streamify",
    dec:
        "Streamify is a personal streaming app built with Flutter, bringing you Movies, Series, and Live TV all in one place!Stream your favorite content smoothly and fast, powered by the Xtream Codes API and designed with Clean Architecture for high performance and scalability.",

    skils: [
      "Dart",
      "Flutter",
      "(cubit)bloc",
      "Video Player",
      "Hive",
      "Clean Architecture",
      "Xtream Codes API ",
      "Dio",
      "DI",
      "Isolates",
    ],
    github: "https://github.com/mohamed20254/Nova-Filx",
  ),
  ProjectModel(
    title2: "_App",
    image: AppIimage.novaMart,
    title1: "Nova-Mart",
    dec:
        "Mobile e-commerce application built with Flutter to sell clothing, electronics, and accessories.Supports multi-language, online/offline usage, and secure online payments. Designed with Clean Architecture for scalability and maintainability.",

    skils: [
      "Dart",
      "Flutter",
      "(cubit)bloc",
      "Payment Gateway",
      "Firebase",
      "Hive",
      "Clean Architecture",
      "AppLocalization ",
      "Admin Dashboard",
      "DI",
      "Isolates",
    ],
    github: "https://github.com/mohamed20254/Nova-Mart",
  ),
  ProjectModel(
    title2: "_App",
    image: AppIimage.chat,
    title1: "Chat",
    dec:
        "Mobile chat application built with Flutter to provide real-time messaging. Supports user authentication, contacts access, and responsive UI. Designed with Bloc + MVVM architecture for scalability and maintainability.",

    skils: [
      "Real-time",
      "Contacts Access ",
      "Lifecycle Management",
      "Dart",
      "Flutter",
      "(cubit)bloc",
      "Offline Support "
          "Firebase",
      "Hive",
      "MVVM Architecture",
      "DI",
    ],
    github: "https://github.com/mohamed20254/Chat_App",
  ),
  ProjectModel(
    title2: "_Web",
    image: AppIimage.panal,
    title1: "Dashborad",
    dec:
        "A professional dashboard application for product management, featuring analytics visualization and data tracking.Built using Flutter & Firebase with MVVM architecture and Cubit state management.Supports responsive and adaptive UI, along with Navigator 2.0 and deep linking.",

    github: "https://github.com/mohamed20254/Dashborad",
    skils: [
      "Responsive + Adaptive",
      " Deep Linking",
      "Navigator 2.0",
      "Dart",
      "Flutter",
      "(cubit)bloc",
      "Firebase",
      "MVVM Architecture",
    ],
  ),
  ProjectModel(
    title2: "_App",
    image: AppIimage.cars,
    title1: "car services",
    dec:
        "A car services mobile application built with Flutter, featuring a clean and modern UI with a smooth user experience.The app includes service listing, booking details, and appointment management.It is integrated with a PHP & MySQL backend for data handling and service management.",

    skils: [
      "Dart",
      "Flutter",
      "Getx",
      "Mvc Architecture",
      "PHP & MySQL backend",
      "payment",
    ],
    github: "https://github.com/mohamed20254/Car_Services",
  ),
  ProjectModel(
    title2: "_App",
    image: AppIimage.vocablary,
    title1: " Local Dictionary",
    dec:
        "A local dictionary application built with Flutter that provides words, meanings, and examples with a powerful filtering and sorting system.Designed using Cubit + MVC architecture with Hive local database for fast and offline access.",
    skils: [
      "Hive (Local Database)",
      "Clean Code"
          "Dart",
      "Flutter",
      "(cubit)bloc",
      "Mvc Architecture",
    ],
    github: "https://github.com/mohamed20254/vocabulary-local-App",
  ),
  ProjectModel(
    title2: "Location",
    image: AppIimage.notes,
    title1: "Notes-with-",
    dec:
        "Notes-with-Location is a mobile application that allows users to create, edit, and manage notes with optional location tagging.It helps users organize their notes by associating them with specific places for easier recall and better organization.",
    github: "https://github.com/mohamed20254/Notes-with-Location",
    skils: [
      "Platform Channels"
          "GPS location"
          "Hive (Local Database)",
      "Clean Code"
          "Dart",
      "Flutter",
      "(cubit)bloc",
      "Mvc Architecture",
    ],
  ),
];

List<ProjectModel> projectsUi = [
  ProjectModel(
    image: AppIimage.cinmai,
    title1: "Cinema_",
    dec:
        "A cinema mobile application UI built with Flutter, focusing on clean modern design and smooth user experience. This project demonstrates movie listing, showtime details, and ticket booking pages. It is a UI-only project without backend or architecture.",
    skils: ["ui", "mvc", "Dart", "flutter"],
    github: "https://github.com/mohamed20254/4Projects_UI",
    title2: "UI",
  ),

  ProjectModel(
    image: AppIimage.recipui,
    title1: "Recipe_",
    dec:
        "A recipe mobile application UI built with Flutter, focusing on clean modern design and smooth user experience. This project demonstrates recipe listing, detailed recipe pages, and ingredient steps. It is a UI-only project without backend or architecture.",

    skils: ["ui", "mvc", "Dart", "flutter"],
    title2: "UI",
    github: "https://github.com/mohamed20254/4Projects_UI",
  ),
  ProjectModel(
    image: AppIimage.travil,
    title1: "Travel_",
    dec:
        "A travel mobile application UI built with Flutter, focusing on clean modern design and smooth user experience. This project demonstrates destination listing, trip details, and booking pages. It is a UI-only project without backend or architecture.",
    github: "https://github.com/mohamed20254/4Projects_UI",
    title2: "UI",
  ),
  ProjectModel(
    image: AppIimage.borgerui,
    title1: "Burger_",
    dec:
        "A Burger ordering mobile application UI built with Flutter, focusing on clean modern design and smooth user experience. This project demonstrates menu listing, burger customization, and cart pages. It is a UI-only project without backend or architecture.",
    github: "https://github.com/mohamed20254/4Projects_UI",
    title2: "UI",
    skils: ["ui", "mvc", "Dart", "flutter"],
  ),
  ProjectModel(
    title1: "Ecommerc_",
    image: AppIimage.ecommercui,
    title2: "UI",
    dec:
        "An e-commerce mobile application UI built with Flutter, focusing on clean modern design and smooth user experience. This project demonstrates product listing, product details, and cart pages. It is a UI-only project without backend or architecture.",

    github: "https://github.com/mohamed20254/Ecommer_App_UI",
    skils: ["ui", "Dark Mode", "mvc", "Dart", "flutter"],
  ),
];
