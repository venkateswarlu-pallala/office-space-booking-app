import 'package:flutter/material.dart';
import 'package:homler/config/appbars/search_appbar.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/core/main/commercialSearch/view/filter_card.dart';

import '../../../../config/routes/routers.dart';
import '../../home/view/cabin_card.dart';
class CommercialSearch extends StatefulWidget {
  const CommercialSearch({super.key});

  @override
  State<CommercialSearch> createState() => _CommercialSearchState();
}

class _CommercialSearchState extends State<CommercialSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: SearchAppBar(),
        automaticallyImplyLeading: false,),

          body: Row(
                  children: [
          FilterCard(),
          Container(
            constraints:BoxConstraints(maxWidth: 4),
            color: AppColors.hint,
          ),
          Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: LayoutBuilder(
                          builder: (context, constraints) {

                            int crossAxisCount;

                            if (constraints.maxWidth < 600) {
                              crossAxisCount = 1; // mobile
                            }
                            else if (constraints.maxWidth < 1024) {
                              crossAxisCount = 2; // tablet
                            }
                            else if (constraints.maxWidth < 1440) {
                              crossAxisCount = 3; // laptop
                            }
                            else {
                              crossAxisCount = 4; // desktop
                            }

                            return GridView.builder(
                              itemCount: 15,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 370,

                                  ),
                                  child: AnimButton(
                                    onTap: _onCardClick,
                                    child: CabinCard(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],

              ),
    );
  }

  void _onCardClick() => commercialDetailsRoute.navigate;

}
