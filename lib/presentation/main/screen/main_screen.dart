import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/constant/app_iimage.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/core/utils/url_luncher.dart';
import 'package:portofilo/presentation/about/screen/about_me.dart';

import 'package:portofilo/presentation/home/screen/home_screen.dart';
import 'package:portofilo/presentation/main/widget/button_whatsapp.dart';
import 'package:portofilo/presentation/main/widget/custom_animation.dart';
import 'package:portofilo/presentation/main/widget/cv.dart';
import 'package:portofilo/presentation/main/widget/row_socil.dart';
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
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scafoldkey = GlobalKey<ScaffoldState>();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    var nextIndex = 0;
    final sectionKeys = [home, apout, skills, project];

    for (var index = 0; index < sectionKeys.length; index++) {
      final sectionContext = sectionKeys[index].currentContext;
      final renderObject = sectionContext?.findRenderObject();
      if (renderObject is RenderBox &&
          renderObject.hasSize &&
          renderObject.localToGlobal(Offset.zero).dy <= 100) {
        nextIndex = index;
      }
    }

    if (nextIndex != _currentIndex.value) {
      _currentIndex.value = nextIndex;
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    _currentIndex.dispose();
    isHovered.dispose();
    super.dispose();
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
                ? ValueListenableBuilder<int>(
                  valueListenable: _currentIndex,
                  builder:
                      (final context, final currentIndex, final child) =>
                          Align(
                            alignment: Alignment.topCenter,
                            child: _headers(
                              size,
                              context,
                              currentIndex,
                              isHovered,
                            ),
                          ),
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
                        ),
                      ),

                    SliverToBoxAdapter(child: HomeScreen(homekey: home)),
                    SliverToBoxAdapter(
                      child:
                          SizedBox(
                            height: Responsive.isMobile(context) ? 48 : 88,
                          ),
                    ),

                    SliverToBoxAdapter(
                      child: CustomAnimatedSlide(
                        key: apout,
                        valueKey: const ValueKey("apout_meKey"),
                        builder: () => AboutMe(size: size, apoutey: apout),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:
                          SizedBox(
                            height: Responsive.isMobile(context) ? 48 : 88,
                          ),
                    ),

                    SliverToBoxAdapter(
                      child: _sectionSurface(
                        context,
                        KeyedSubtree(
                          key: const ValueKey('mySkillsScreen'),
                          child: MySkillsScreen(
                            skillKey: skills,
                            ismobile: ismobile,
                          ),
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:
                          SizedBox(
                            height: Responsive.isMobile(context) ? 48 : 88,
                          ),
                    ),

                    SliverToBoxAdapter(
                      child: _sectionSurface(
                        context,
                        ProjectScreen(projectgey: project),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:
                          ismobile
                              ? const SizedBox(height: 40)
                              : const SizedBox(height: 64),
                    ),

                    SliverToBoxAdapter(child: _buildCv(context)),

                    const SliverToBoxAdapter(child: SizedBox(height: 32)),
                    Responsive.isTablet(context)
                        ? SliverToBoxAdapter(
                          child: CustomAnimatedSlide(
                            valueKey: const ValueKey("row_socil"),
                            builder:
                                () => const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [RowSocil()],
                                ),
                          ),
                        )
                        : const SliverToBoxAdapter(child: SizedBox()),
                    const SliverToBoxAdapter(child: SizedBox(height: 22)),
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

                    const SliverToBoxAdapter(child: SizedBox(height: 22)),
                    const SliverToBoxAdapter(
                      child: Divider(endIndent: 100, indent: 100),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionSurface(final BuildContext context, final Widget child) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 8),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 18 : 28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withValues(alpha: 0.22),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColor.navyBlue.withValues(alpha: 0.12),
          ),
        ),
      ),
      child: child,
    );
  }

  Column _buildCv(final BuildContext context) {
    return Column(
      children: [
        CustomAnimatedSlide(
          valueKey: const ValueKey("cv_key"),
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
                  CustomButtonCv(
                    iscv: true,
                    title: "Download CV",
                    dec:
                        "Get my complete  resume with detailed experience,\n skills, and achievements",
                    icon: Bootstrap.download,
                    color: const Color.fromARGB(255, 47, 108, 241),
                    textbuton: "Download",
                    ontap: () {
                      UriLuncher.launchurl(
                        "https://drive.google.com/uc?export=download&id=1kJwoTAD4Lz9GnD1B3tdYtqbQPjp0X4Ut",
                        context: context,
                      );
                    },
                  ),
                ],
              ),
        ),
        const SizedBox(height: 20),
        Responsive.isTablet(context)
            ? CustomAnimatedSlide(
              valueKey: const ValueKey("button Whatsapp"),
              builder:
                  () => CustomButtonCv(
                    title: "WhatsApp Chat",
                    dec:
                        "Let's discuss your project requirements and  how I \n can help you achieve your goals",
                    icon: Bootstrap.whatsapp,
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
  ) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          Image.asset(AppIimage.triange, fit: BoxFit.contain, height: 30.h),
          _drower(),

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
    final int currentIndex,
    final ishaverd,
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
  Widget _drower() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<int>(
          tooltip: 'Open navigation',
          icon: const Icon(Icons.menu, size: 27),
          onSelected: (final index) {
            final sectionKeys = [home, apout, skills, project];
            scroilCoindion(sectionKeys[index].currentContext);
          },
          itemBuilder:
              (final context) => const [
                PopupMenuItem(
                  value: 0,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.home_outlined),
                    title: Text('Home'),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.person_outline),
                    title: Text('About me'),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.auto_awesome_outlined),
                    title: Text('Skills'),
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.work_outline),
                    title: Text('My work'),
                  ),
                ),
              ],
        ),
        Text('Menu', style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
