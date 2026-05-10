    import 'package:flutter/material.dart';
    import 'package:homler/config/extensions/response_font_extension.dart';
    import 'package:homler/core/main/home/view/form_quick_book.dart';
    import 'package:homler/config/themes/app_colors.dart';
    import 'package:homler/config/themes/font_styles.dart';
    import '../../../../config/appbars/footer.dart';
    import '../../../../config/appbars/main_appbar.dart';
    import '../../../../config/elements/center_max.dart';
    
    import 'cabin_card.dart';
    import 'events.dart';
    import 'features.dart';
    import 'form_search.dart';
    import 'info.dart';
    import 'subscribe.dart';
    import 'time_line.dart';
    import 'trust_by.dart';
    import 'lease_card.dart';
    import 'seat_card.dart';
    import '../../../../config/themes/gradient_style.dart';

    class HomePage extends StatefulWidget {
       const HomePage({super.key});
      @override
      State<HomePage> createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: CenterMax(
              padding:  EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MainAppbar(type: MainAppbarTypes.home),
                  Divider(height: 1, thickness: 1, color: AppColors.grey),
                  SizedBox(height: 24),
                  _carousel(),

                  SizedBox(height: 24 + 70.sp,),

                  Center(
                    child: Wrap(
                      runSpacing: 26,
                      children: [
                        SizedBox(
                          width: 687,
                          height: 424,
                          child: FormSearch(),
                        ),
                         SizedBox(width: 26),
                        SizedBox(
                          width: 687,
                          child: FormQuickBook(),
                        ),
                      ],
                    ),
                  ), //quick book
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "Top seat bookings",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                      textAlign: TextAlign.center,
                    ),
                  ), //
                  SizedBox(height: 15),
                  Center(
                    child: Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.center,
                      children: [SeatCard(), SeatCard(), SeatCard()],
                    ),
                  ), //top seats
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "Top Cabin bookings",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,

                      spacing: 32,
                      runSpacing: 32,
                      children: [CabinCard(), CabinCard(), CabinCard(),],
                    ),
                  ), //Top cabins
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "Top  Lease",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,

                      spacing: 32,
                      runSpacing: 32,
                      children: [LeaseCard(), LeaseCard(), LeaseCard()],
                    ),
                  ), //top lease
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "Trusted By",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                    ),
                  ),
                  SizedBox(height: 15),
                   Center(child: TrustBy()),
                  //trusted by
                  SizedBox(height: 90),
                  Subscribe(),
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "Find spaces on the map",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                      textAlign: TextAlign.center,
                    ),
                  ), //
                  SizedBox(height: 15), //maps
                  Container(
                    constraints: BoxConstraints(maxWidth: 1512, maxHeight: 600),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  Center(
                    child: GradientText(
                      text: "How Homler works — Product journey",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15), //how the homler works
                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 822, minHeight: 600),
                      child:Wrap(
                        spacing: 30,
                        runSpacing: 10,
                        children: [

                          Column(
                            children: [
                              SizedBox(height: 210),
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: TimelineItem(
                                  title: "Discover",
                                  content:
                                      "Find desks, cabins, private offices and commercial listings filtered by size, amenities and lease terms.",
                                  position: TimelinePosition.top,
                                ),
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 68),
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: TimelineItem(
                                  title: "Inspect",
                                  content:
                                      "Browse high-res photos, floor plans and availability for short stays or long leases.",
                                  position: TimelinePosition.bottom,
                                ),
                              ),
                              SizedBox(height: 170),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 177),
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: TimelineItem(
                                  title: "Book or Lease",
                                  content:
                                      "Instant short-term booking for seats and cabins, or apply to lease commercial property for months or years.",
                                  position: TimelinePosition.top,
                                ),
                              ),
                              SizedBox(height: 24),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 4),
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: TimelineItem(
                                  title: "Convert & Scale",
                                  content:
                                      "Owners can convert commercial spaces into rentable units on Homler — manage listings, pricing and bookings from one place.",
                                  position: TimelinePosition.bottom,
                                ),
                              ),
                              SizedBox(height: 140),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  Features(),
                  Container( constraints: BoxConstraints(maxWidth: 1512),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 34),
                    child: Info(),
                  ), //features section
                  SizedBox(height: 80),
                  Center(
                    child: GradientText(
                      text: "Upcoming events & meetups",
                      style: FontStyles.s32Linear4,
                      gradient: AppColors.darkGlowGradient,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Events(),
                  SizedBox(height: 30,),
                  Footer(),
                ],
              ),
            ),
          ),
        );
      }
    }
    Widget _carousel() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: AspectRatio(
          aspectRatio: 3 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/image_home.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }