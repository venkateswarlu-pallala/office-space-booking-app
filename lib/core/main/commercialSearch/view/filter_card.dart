import 'package:flutter/material.dart';
import '../../../../config/elements/button.dart';
import '../../../../config/elements/custom_drop_down.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({super.key});

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  final TextEditingController fromDateController =
  TextEditingController();
  final TextEditingController toDateController =
  TextEditingController();
  bool isChecked = true;
  final selectedOptions = {"Day","Wifi" };

  String selectedOption = "Seat";
  DropDownValue<String>? selected;

  double _price = 5000;
  double minPrice = 200;
  double maxPrice = 10000;


  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text =
      "${picked.day}-${picked.month}-${picked.year}";
    }
  }


  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(maxWidth: 300),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 300,maxHeight: 44
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),

            child: Row(
              children: [
                Image.asset("assets/icons/ic_filter.png"),
                 SizedBox(width: 10),
                GradientText(
                  text: "Filter",
                  style: FontStyles.s14TextW7,
                  gradient: AppColors.darkGlowGradient,
                ),
              ],
            ),
          ),
          Divider(thickness: 2,color: AppColors.hint,),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    bottom: 80, // important space for button
                    left: 16,
                    right: 16,
                    top: 10,
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _field(hint: "Enter Location"),

                      _date(
                        controller: fromDateController,
                        hint: "From ",
                      ),
                      _date(
                        controller: toDateController,
                        hint: "To ",
                      ),

                      SizedBox(
                        height: 52,
                        width: double.infinity,
                        child: CustomDropdown<String>(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          items: ["Seat ", "Cabin", "Lease"],
                          value: selected,
                          hint: "Category",
                          onChanged: (val) {
                            setState(() {
                              selected =
                                  DropDownValue(value: val!, label: val);
                            });
                          },
                        ),
                      ),

                      _field(hint: "Seat Count"),

                       SizedBox(height: 10),
                      Text(
                        "Price",
                        style: FontStyles.s14HighlightW4,
                      ),

                      Center(
                        child: Text(
                          "${_price.round()}",
                          style: FontStyles.s12TextW7,
                        ),
                      ),

                      Slider(
                        value: _price,
                        min: minPrice,
                        max: maxPrice,
                        divisions: 100,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.grey,
                        onChanged: (double value) {
                          setState(() {
                            _price = value;
                          });
                        },
                      ),

                      Row(
                        children: [
                          Text("200",
                              style: FontStyles.s12TextW4),
                          Spacer(),
                          Text("1000000",
                              style: FontStyles.s12TextW4),
                        ],
                      ),

                       SizedBox(height: 10),
                      Text(
                        "Shifts",
                        style: FontStyles.s14HighlightW4,
                      ),

                      _checkbox("Day"),
                      _checkbox("Night"),
                      _checkbox("2nd Shift"),

                       SizedBox(height: 10),
                      Text(
                        "Amenities",
                        style: FontStyles.s14HighlightW4,
                      ),

                      _checkbox("Wifi"),
                      _checkbox("Ac"),
                      _checkbox("CC Camera"),
                      _checkbox("Power backup"),
                    ],
                  ),
                ),

                /// 🔥 Fixed Bottom Button
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 64,
                    padding:  EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children:[
                        Text("clear",
                        style: FontStyles.s14HintW5,),
                        Spacer(),
                        Button(onTap: (){}, text: "Apply",
                          width: 109,style: FontStyles.s16WhiteW5,
                        height: 40,),
    ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _field({
    double width = 276,
    double height = 48,
    required String hint,
  }) {
    return Container(
      constraints:
      BoxConstraints(maxWidth: width, minHeight: height),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: FontStyles.s14HintW5,
          border: InputBorder.none,
          contentPadding:
           EdgeInsets.fromLTRB(16, 15, 0, 17),
        ),
      ),
    );
  }

  Widget _date({
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: () => _pickDate(controller),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: FontStyles.s14HintW5,

          border: InputBorder.none,
          contentPadding:
          EdgeInsets.fromLTRB(16, 15, 0, 17),
          suffixIcon:
           Icon(Icons.calendar_today_outlined),


        ),
      ),
    );
    
  }
  Widget _checkbox(String title) {
    return Row(
      children: [
        Checkbox(
          value: selectedOptions.contains(title),
          onChanged: (bool? checked) {
            setState(() {
              if (checked == true) {
                selectedOptions.add(title);
              } else {
                selectedOptions.remove(title);
              }
            });
          },
          activeColor: AppColors.primary,
        ),
        Text(title),
      ],
    );
  }

}
