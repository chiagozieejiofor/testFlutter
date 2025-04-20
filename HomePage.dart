import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:testinterview/searchpage.dart';

import 'globalVariable.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();
  bool _inView = false;

  final GlobalKey _boxKey = GlobalKey();
  final GlobalKey _boxKey2 = GlobalKey();
  final GlobalKey _boxKey3 = GlobalKey();
  final GlobalKey _boxKey4 = GlobalKey();

  void _checkIfInView() {
    final RenderBox? box =
        _boxKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final position = box.localToGlobal(Offset.zero).dy;
      final screenHeight = MediaQuery.of(context).size.height;

      if (position < screenHeight && !_inView) {
        setState(() {
          _inView = true;
        });
      }
    }
  }

  late final AssetImage _bgImage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkIfInView);
    _bgImage = const AssetImage(
        'assets/profile/luxury-hotel-reception-hall-lounge-restaurant-with-high-ceiling.jpg');

    isLoaded = false;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkIfInView);
    _scrollController.dispose();
    newlistingFontSize = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-1.4, -1.3), // Top-left corner
          radius: 2.5,

          colors: [
            Color(0xFFFFF3E0),
            Color(0xFFFFB066), // light orange
            // almost white
          ],
        ),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header
            Padding(
              padding: const EdgeInsets.only(top: 64.0, left: 16, right: 16),
              child: Row(
                children: [
                  // location bar
                  IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.23),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(Icons.location_on_rounded,
                                    size: 15, color: Color(0xFFDCC1A0))
                                .animate()
                                .fadeIn(
                                    delay: const Duration(seconds: 1),
                                    duration: const Duration(seconds: 1)),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                "Apo, Abuja. FCT",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFFDCC1A0),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ).animate().fadeIn(
                                  delay: const Duration(seconds: 1),
                                  duration: const Duration(seconds: 1)),
                            ),
                            const SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ).animate().scaleX(
                      alignment: Alignment.centerLeft,
                      duration: const Duration(seconds: 1)),
                  const Spacer(),
                  //profile Avatar
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile/ai.jpg'),
                  ).animate().scaleXY(duration: const Duration(seconds: 1))
                ],
              ),
            ),

            //body content
            /// Hi blaireceen
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Row(
                children: [
                  Text(
                    'Hi, Blaireceen',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFFDCC1A0),
                        fontSize: 27,
                        fontWeight: FontWeight.w500),
                  ).animate().fadeIn(duration: const Duration(seconds: 2))
                ],
              ),
            ),

            ///lets select a place for you
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "let's select your perfect place",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )
                        .animate()
                        .fadeIn(duration: const Duration(seconds: 2))
                        .moveY(
                            begin: 20,
                            end: 0,
                            duration: const Duration(seconds: 2)),
                  )
                ],
              ),
            ),

            //counter container
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Row(
                children: [
                  // BUY Counter
                  Expanded(
                    child: Container(
                      height: 160,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFfc8c03),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            'BUY',
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          TweenAnimationBuilder<int>(
                              duration: const Duration(seconds: 3),
                              tween: IntTween(begin: 0, end: 1034),
                              builder: (context, value, child) {
                                String valueStr = value.toString();
                                if (valueStr.length > 1) {
                                  valueStr =
                                      '${valueStr[0]} ${valueStr.substring(1)}';
                                }
                                return Text(
                                  valueStr,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40,
                                  ),
                                );
                              }),
                          Text(
                            'offers',
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),
                  // Rent Counter
                  Expanded(
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        shape: BoxShape.rectangle,
                        color: const Color(0xFFfce2c2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Spacer(),
                          Text(
                            'Rent',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFDCC1A0),
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          TweenAnimationBuilder<int>(
                            duration: const Duration(seconds: 3),
                            tween: IntTween(begin: 0, end: 2212),
                            builder: (context, value, child) {
                              String valueStr = value.toString();
                              if (valueStr.length > 1) {
                                valueStr =
                                    '${valueStr[0]} ${valueStr.substring(1)}';
                              }

                              return Text(
                                valueStr,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFDCC1A0),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                ),
                              );
                            },
                          ),
                          Text(
                            'offers',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFDCC1A0),
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //listed content

            AnimationLimiter(
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 24),
                child: IntrinsicHeight(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          duration: const Duration(milliseconds: 1500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: _bgImage,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AnimatedContainer(
                                          key: _boxKey,
                                          height: 50,
                                          width: _inView
                                              ? MediaQuery.of(context)
                                                  .size
                                                  .width
                                              : 100,
                                          onEnd: () {
                                            newlistingFontSize = 14;
                                            setState(() {
                                              isLoaded = true;
                                            });
                                          },
                                          duration: const Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.9))
                                              ],
                                              gradient: LinearGradient(colors: [
                                                Colors.orangeAccent
                                                    .withOpacity(0.5),
                                                const Color(0xFFFFB066)
                                                    .withOpacity(0.3),
                                              ])),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Spacer(),
                                              isLoaded == false
                                                  ? const Text('')
                                                  : Animate(
                                                      effects: const [
                                                        FadeEffect(
                                                            duration: Duration(
                                                                seconds: 1))
                                                      ],
                                                      child: Text(
                                                        'Transcorp Hilton,St 25',
                                                        style: GoogleFonts.poppins(
                                                            fontSize:
                                                                newlistingFontSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                              const Spacer(),
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          spreadRadius: 2,
                                                          blurRadius: 20,
                                                          offset: const Offset(
                                                              -5, 0),
                                                          color: Colors
                                                              .grey.shade900
                                                              .withOpacity(0.5))
                                                    ]),
                                                child: HugeIcon(
                                                    icon: HugeIcons
                                                        .strokeRoundedArrowRight01,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: const Duration(milliseconds: 2000),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Row(
                                children: [
                                  // Left container
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 308,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/profile/swim.jpg'),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AnimatedContainer(
                                                key: _boxKey2,
                                                height: 30,
                                                width: _inView
                                                    ? MediaQuery.of(context)
                                                        .size
                                                        .width
                                                    : 100,
                                                onEnd: () {
                                                  newlistingFontSize2 = 10;
                                                  setState(() {
                                                    isLoaded = true;
                                                  });
                                                },
                                                duration:
                                                    const Duration(seconds: 7),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.9))
                                                    ],
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Colors.orangeAccent
                                                          .withOpacity(0.5),
                                                      const Color(0xFFFFB066)
                                                          .withOpacity(0.5),
                                                    ])),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Spacer(),
                                                    isLoaded == false
                                                        ? const Text('')
                                                        : Animate(
                                                            effects: const [
                                                              FadeEffect(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1))
                                                            ],
                                                            child: Text(
                                                              'Chevron,45',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      newlistingFontSize2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                spreadRadius: 2,
                                                                blurRadius: 20,
                                                                offset:
                                                                    const Offset(
                                                                        -5, 0),
                                                                color: Colors
                                                                    .grey
                                                                    .shade900
                                                                    .withOpacity(
                                                                        0.5))
                                                          ]),
                                                      child: HugeIcon(
                                                          icon: HugeIcons
                                                              .strokeRoundedArrowRight01,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Right column
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/profile/umbrella-chair.jpg'),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: AnimatedContainer(
                                                    key: _boxKey3,
                                                    height: 30,
                                                    width: _inView
                                                        ? MediaQuery.of(context)
                                                            .size
                                                            .width
                                                        : 50,
                                                    onEnd: () {
                                                      newlistingFontSize3 = 10;
                                                      setState(() {
                                                        isLoaded = true;
                                                      });
                                                    },
                                                    duration: const Duration(
                                                        milliseconds: 5000),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.9))
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors
                                                                  .orangeAccent
                                                                  .withOpacity(
                                                                      0.5),
                                                              const Color(
                                                                      0xFFFFB066)
                                                                  .withOpacity(
                                                                      0.5),
                                                            ])),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Spacer(),
                                                        isLoaded == false
                                                            ? const Text('')
                                                            : Animate(
                                                                effects: const [
                                                                  FadeEffect(
                                                                      duration: Duration(
                                                                          seconds:
                                                                              1))
                                                                ],
                                                                child: Text(
                                                                  'St Fraizer suite',
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          newlistingFontSize3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        20,
                                                                    offset:
                                                                        const Offset(
                                                                            -5,
                                                                            0),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade900
                                                                        .withOpacity(
                                                                            0.5))
                                                              ]),
                                                          child: HugeIcon(
                                                              icon: HugeIcons
                                                                  .strokeRoundedArrowRight01,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/profile/sunset-pool.jpg'),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: AnimatedContainer(
                                                    key: _boxKey4,
                                                    height: 30,
                                                    width: _inView
                                                        ? MediaQuery.of(context)
                                                            .size
                                                            .width
                                                        : 100,
                                                    onEnd: () {
                                                      newlistingFontSize2 = 10;
                                                      setState(() {
                                                        isLoaded = true;
                                                      });
                                                    },
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.9))
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Colors
                                                                  .orangeAccent
                                                                  .withOpacity(
                                                                      0.5),
                                                              const Color(
                                                                      0xFFFFB066)
                                                                  .withOpacity(
                                                                      0.5),
                                                            ])),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Spacer(),
                                                        isLoaded == false
                                                            ? const Text('')
                                                            : Animate(
                                                                effects: const [
                                                                  FadeEffect(
                                                                      duration: Duration(
                                                                          seconds:
                                                                              7))
                                                                ],
                                                                child: Text(
                                                                  'Devons villa,16',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          newlistingFontSize2,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        20,
                                                                    offset:
                                                                        const Offset(
                                                                            -5,
                                                                            0),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade900
                                                                        .withOpacity(
                                                                            0.5))
                                                              ]),
                                                          child: HugeIcon(
                                                              icon: HugeIcons
                                                                  .strokeRoundedArrowRight01,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().moveY(
                      begin: 150, end: 0, duration: const Duration(seconds: 1)),
                ),
              ),
            ),

            //
          ],
        ),
      ), // we’ll build this next
    );
  }
}
