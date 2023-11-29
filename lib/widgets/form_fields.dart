import 'package:flutter/material.dart';
import 'package:medicare/widgets/slider.dart';

class FormFields extends StatelessWidget {
  final List<String> weightValues = ["pills", "ml", "mg"];
  final int howManyWeeks;
  final String selectWeight;
  final Function onPopUpMenuChanged, onSliderChanged;
  final TextEditingController nameController;
  final TextEditingController amountController;
  FormFields(this.howManyWeeks, this.selectWeight, this.onPopUpMenuChanged,
      this.onSliderChanged, this.nameController, this.amountController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return LayoutBuilder(
      builder: (context, constrains) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: constrains.maxHeight * 0.22,
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: nameController,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 0.5, color: Colors.grey))),
              onSubmitted: (val) => focus.nextFocus(),
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.07,
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: constrains.maxHeight * 0.22,
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        labelText: "Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.grey))),
                    onSubmitted: (val) => focus.unfocus(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: constrains.maxHeight * 0.22,
                  child: DropdownButtonFormField(
                    onTap: () => focus.unfocus(),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        labelText: "Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.grey))),
                    items: weightValues
                        .map((weight) => DropdownMenuItem(
                              value: weight,
                              child: Text(weight),
                            ))
                        .toList(),
                    onChanged: (value) => onPopUpMenuChanged(value),
                    value: selectWeight,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: constrains.maxHeight * 0.1,
          ),
          SizedBox(
            height: constrains.maxHeight * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: FittedBox(
                child: Text(
                  "Duration",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
              height: constrains.maxHeight * 0.18,
              child: UserSlider(onSliderChanged, howManyWeeks)),
          Align(
            alignment: Alignment.bottomRight,
            child: FittedBox(child: Text('$howManyWeeks weeks')),
          )
        ],
      ),
    );
  }
}
