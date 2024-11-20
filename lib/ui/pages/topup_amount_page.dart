import 'package:bank_sat/shared/theme.dart';
import 'package:bank_sat/ui/widgets/index.dart';
import 'package:bank_sat/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopupAmoutPage extends StatefulWidget {
  const TopupAmoutPage({super.key});

  @override
  State<TopupAmoutPage> createState() => _TopupAmoutPageState();
}

class _TopupAmoutPageState extends State<TopupAmoutPage> {
  final TextEditingController inputController =
      TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();

    inputController.addListener(() {
      final text = inputController.text;

      inputController.value = inputController.value.copyWith(
        text: NumberFormat.currency(
          locale: "id",
          decimalDigits: 0,
          symbol: "",
        ).format(
          int.parse(
            text.replaceAll(".", ""),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    setState(() {
      String tempValue =
          inputController.text == "0" ? "" : inputController.text;
      inputController.text = tempValue + number;
    });
  }

  deleteAmount() {
    if (inputController.text.isNotEmpty) {
      setState(() {
        String textValue = inputController.text;
        String tempValue = textValue.substring(0, textValue.length - 1);

        if (tempValue.isEmpty) {
          tempValue = "0";
        }
        inputController.text = tempValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double padHorizontal = 58;
    double gap = 40;

    return Screen(
      backgroundColor: darkBgColor,
      appBar: AppBarHeader(
        title: "Jumlah Total",
        titleStyle: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: semiBold,
        ),
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        backgroundColor: darkBgColor,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: padHorizontal,
          vertical: 30,
        ),
        children: [
          const SizedBox(
            height: 37,
          ),
          SizedBox(
            width: screenSize.width - padHorizontal * 2,
            child: TextFormField(
              enabled: false,
              controller: inputController,
              decoration: InputDecoration(
                suffixIconColor: greenColor,
                contentPadding: const EdgeInsets.only(right: 0),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                prefixText: "Rp.",
                prefixStyle: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
              ),
              style: whiteTextStyle.copyWith(
                fontSize: 36,
                fontWeight: medium,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Center(
            child: Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                ..._buildButton1to9(addAmount),
                const SizedBox(
                  width: 60,
                  height: 60,
                ),
                CustomInputButton(
                  title: "0",
                  onTap: () {
                    addAmount("0");
                  },
                ),
                CustomInputButton(
                  onTap: () {
                    deleteAmount();
                  },
                  contentWidget: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: "Lanjutkan",
            onPressed: () async {
              if (await Navigator.pushNamed(context, "/pin") == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/topup-status",
                  (route) => false,
                );
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            title: "Syarat & Ketentuan",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

List<Widget> _buildButton1to9(void Function(String)? addAmount) {
  int index = 0;
  List<Widget> listButton = [];

  while (index < 9) {
    String numberString = (index + 1).toString();
    listButton.add(
      CustomInputButton(
        title: numberString,
        onTap: () {
          addAmount!(numberString);
        },
      ),
    );
    index++;
  }

  return listButton;
}
