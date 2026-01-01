import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/constant/app_iimage.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/core/utils/url_luncher.dart';
import 'package:portofilo/presentation/about/screen/about_me.dart'
    deferred as about_me;

import 'package:portofilo/presentation/home/screen/home_screen.dart';
import 'package:portofilo/presentation/main/widget/button_whatsapp.dart';
import 'package:portofilo/presentation/main/widget/custom_animation.dart';
import 'package:portofilo/presentation/main/widget/cv.dart' deferred as cv;
import 'package:portofilo/presentation/main/widget/row_socil.dart'
    deferred as socil;
import 'package:portofilo/presentation/main/widget/section_widget.dart';
import 'package:portofilo/presentation/skills/screen/my_skills_screen.dart';
import 'package:portofilo/presentation/projects/screen/project_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey home = GlobalKey();
  final GlobalKey apout = GlobalKey();
  final GlobalKey skills = GlobalKey();
  final GlobalKey project = GlobalKey();
  late GlobalKey<ScaffoldState> _scafoldkey;
  int currentIndex = 0;
  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  void initState() {
    _scafoldkey = GlobalKey<ScaffoldState>();
    _scrollController.addListener(() {
      // double scrollOffset = _scrollController.offset;

      final homeContext = home.currentContext;
      final aboutContext = apout.currentContext;
      final skillsContext = skills.currentContext;
      final projectsContext = project.currentContext;

      _currentCondition(homeContext, 0);
      _currentCondition(aboutContext, 1);
      _currentCondition(skillsContext, 2);
      _currentCondition(projectsContext, 3);
    });
    super.initState();
  }

  void _currentCondition(final context, final int index) {
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy;

      if (position <= 100) {
        setState(() {
          currentIndex = index;
        });
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool ismobile = Responsive.isMobile(context);

    return Scaffold(
      key: _scafoldkey,

      body: SafeArea(
        child: Column(
          children: [
            Responsive.isDesktop(context)
                ? Align(
                  alignment: Alignment.topCenter,
                  child: _headers(size, context, isHovered, _scafoldkey),
                )
                : const SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child:
                          Responsive.isTablet(context)
                              ? const SizedBox()
                              : const SizedBox(height: 30),
                    ),
                    if (ismobile)
                      SliverToBoxAdapter(
                        child: _firstHeadermobile(
                          size,
                          context,
                          isHovered,
                          _scafoldkey,
                        ),
                      ),

                    SliverToBoxAdapter(child: HomeScreen(homekey: home)),
                    SliverToBoxAdapter(
                      child:
                          Responsive.isDesktop(context)
                              ? const SizedBox(height: 200)
                              : const SizedBox(height: 100),
                    ),

                    SliverToBoxAdapter(
                      child: CustomAnimatedSlide(
                        key: apout,
                        valueKey: const ValueKey("apout_meKey"),
                        builder:
                            () => about_me.AboutMe(size: size, apoutey: apout),
                        onLoad: () => about_me.loadLibrary(),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:
                          Responsive.isDesktop(context)
                              ? const SizedBox(height: 200)
                              : const SizedBox(height: 100),
                    ),

                    SliverToBoxAdapter(
                      child: KeyedSubtree(
                        key: const ValueKey('mySkillsScreen'),
                        child: MySkillsScreen(
                          skillKey: skills,
                          ismobile: ismobile,
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:
                          Responsive.isDesktop(context)
                              ? const SizedBox(height: 200)
                              : const SizedBox(height: 100),
                    ),

                    SliverToBoxAdapter(
                      child: ProjectScreen(projectgey: project),
                    ),

                    SliverToBoxAdapter(
                      child:
                          ismobile
                              ? const SizedBox(height: 50)
                              : const SizedBox(height: 100),
                    ),

                    SliverToBoxAdapter(child: _buildCv(context)),

                    const SliverToBoxAdapter(child: SizedBox(height: 50)),
                    Responsive.isTablet(context)
                        ? SliverToBoxAdapter(
                          child: CustomAnimatedSlide(
                            valueKey: const ValueKey("row_socil"),
                            onLoad: () => socil.loadLibrary(),
                            builder:
                                // ignore: prefer_const_constructors
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [socil.RowSocil()],
                                ),
                          ),
                        )
                        : const SliverToBoxAdapter(child: SizedBox()),
                    const SliverToBoxAdapter(child: SizedBox(height: 30)),
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Ready to bring your vision to life with cutting-edge technology",
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 30)),
                    const SliverToBoxAdapter(
                      child: Divider(endIndent: 100, indent: 100),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 50)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildCv(final BuildContext context) {
    return Column(
      children: [
        CustomAnimatedSlide(
          valueKey: const ValueKey("cv_key"),
          onLoad: () => cv.loadLibrary(),
          builder:
              () => Column(
                children: [
                  Text(
                    !Responsive.isTablet(context)
                        ? "Get my CV"
                        : "Get In Touch",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 30),
                  cv.CustomButtonCv(
                    title: "Download CV",
                    dec:
                        "Get my complete  resume with detailed experience,\n skills, and achievements",
                    icon: Icons.download,
                    color: const Color.fromARGB(255, 47, 108, 241),
                    textbuton: "Download Now",
                    ontap: () {},
                  ),
                ],
              ),
        ),
        const SizedBox(height: 20),
        Responsive.isTablet(context)
            ? CustomAnimatedSlide(
              onLoad: () => cv.loadLibrary(),
              valueKey: const ValueKey("button Whatsapp"),
              builder:
                  () => cv.CustomButtonCv(
                    title: "WhatsApp Chat",
                    dec:
                        "Let's discuss your project requirements and  how I \n can help you achieve your goals",
                    icon: FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    textbuton: "Start chat",
                    ontap: () {
                      UriLuncher.openWhatsApp(context);
                    },
                  ),
            )
            : const SizedBox(),
      ],
    );
  }

  SizedBox _firstHeadermobile(
    final Size size,
    final context,
    final ishaverd,
    final scfoldkey,
  ) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          Image.asset(AppIimage.triange, fit: BoxFit.contain, height: 30.h),
          _drower(scfoldkey),

          const Spacer(),
          buttonWhatsapp(size, context, ishaverd),
          SizedBox(width: size.width * 0.01),
        ],
      ),
    );
  }

  //headers
  Padding _headers(
    final Size size,
    final BuildContext context,
    final ishaverd,
    final scfoldkey,
  ) {
    return Padding(
      padding: EdgeInsets.all(4.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Responsive.isMobile(context)
                  ? const SizedBox()
                  : Image.asset(
                    AppIimage.triange,
                    fit: BoxFit.contain,
                    height: 30.h,
                  ),
            ],
          ),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          Sections(
            currentindex: currentIndex,
            home: home,
            appout: apout,
            project: project,
            skills: skills,
          ),
          Responsive.isMobile(context)
              ? const SizedBox()
              : buttonWhatsapp(size, context, ishaverd),
        ],
      ),
    );
  }

  //buttomWhatsapp==========

  //Drwer=================
  SizedBox _drower(final GlobalKey<ScaffoldState> scfoldkey) {
    return SizedBox(
      child: IconButton(
        onPressed: () {
          showMenu(
            color: Theme.of(context).cardColor,
            initialValue: 1,
            context: context,
            position: const RelativeRect.fromLTRB(50, 50, 100, 100),
            items: [
              PopupMenuItem<int>(
                value: 1,
                child: const Text("home"),
                onTap: () {
                  final context = home.currentContext;
                  scroilCoindion(context);
                },
              ),
              PopupMenuItem<int>(
                value: 2,
                child: const Text("Apout"),
                onTap: () {
                  final context = apout.currentContext;
                  scroilCoindion(context);
                },
              ),
              PopupMenuItem<int>(
                value: 3,
                child: const Text("skills"),
                onTap: () {
                  final context = skills.currentContext;
                  scroilCoindion(context);
                },
              ),

              PopupMenuItem<int>(
                value: 4,
                child: const Text("My Work"),
                onTap: () {
                  final context = project.currentContext;
                  scroilCoindion(context);
                },
              ),
            ],
          );
        },
        icon: const Icon(Icons.menu, size: 30),
      ),
    );
  }
}
