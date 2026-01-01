import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:portofilo/presentation/main/screen/main_screen.dart';
import 'package:portofilo/presentation/splach/splach_screen.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),

      // splitScreenMode: true,
      builder:
          (final context, final child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter portfilo',
            theme: ThemeData(
              brightness: Brightness.dark,
              cardColor: const Color(0xff101424),
              scaffoldBackgroundColor: const Color.fromARGB(255, 10, 17, 31),
              textTheme: GoogleFonts.abhayaLibreTextTheme().copyWith(
                titleLarge: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
                titleMedium: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
                titleSmall: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                bodyLarge: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
                bodyMedium: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                bodySmall: const TextStyle(
                  height: 0.0,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                labelLarge: const TextStyle(fontSize: 15),
                labelMedium: const TextStyle(
                  fontSize: 8,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                ),
                labelSmall: const TextStyle(
                  fontSize: 6,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                ),
                displaySmall: const TextStyle(
                  fontSize: 5,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (final context) => Routing.routes,
            ),
            routeInformationParser: const RoutemasterParser(),
            //   home: const MainScreen(),
          ),
    );
  }
}

class Routing {
  static int? lastProjectId;

  static final routes = RouteMap(
    routes: {
      '/': (_) => const MaterialPage(child: SplashView()),
      '/main': (_) => const MaterialPage(child: MainScreen()),
      // '/projects/:id': (final route) {
      //   final id = int.parse(route.pathParameters['id']!);
      //   lastProjectId = id;
      //   final project = projects[id];
      //   return MaterialPage(child: AllImagesScreen(images: project.images));
      // },

      // '/full_image/:id': (final info) {
      //   final imageIndex = int.parse(info.pathParameters['id']!); //
      //   final project = projects[lastProjectId!]; //
      //   final imagePath = project.images[imageIndex]; //

      //   return MaterialPage(
      //     child: FullImageView(
      //       imagePath: imagePath,
      //       tag: "image_$imageIndex",
      //       backgroundColor: Colors.black,
      //     ),
      //   );
      // },
    },
  );
}
