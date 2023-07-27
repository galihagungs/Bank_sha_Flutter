import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(text.replaceAll('.', '')),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 58,
        ),
        children: [
          Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Text(
                  'Total Amount',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semibold,
                  ),
                ),
              ),
              const SizedBox(
                height: 67,
              ),
              Align(
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: amountController,
                    cursorColor: greyColor,
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Text(
                        'Rp. ',
                        style: whiteTextStyle.copyWith(
                          fontSize: 36,
                          fontWeight: medium,
                        ),
                      ),
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
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  InputButtonPin(
                    number: '1',
                    onTap: () {
                      addAmount('1');
                    },
                  ),
                  InputButtonPin(
                    number: '2',
                    onTap: () {
                      addAmount('2');
                    },
                  ),
                  InputButtonPin(
                    number: '3',
                    onTap: () {
                      addAmount('3');
                    },
                  ),
                  InputButtonPin(
                    number: '4',
                    onTap: () {
                      addAmount('4');
                    },
                  ),
                  InputButtonPin(
                    number: '5',
                    onTap: () {
                      addAmount('5');
                    },
                  ),
                  InputButtonPin(
                    number: '6',
                    onTap: () {
                      addAmount('6');
                    },
                  ),
                  InputButtonPin(
                    number: '7',
                    onTap: () {
                      addAmount('7');
                    },
                  ),
                  InputButtonPin(
                    number: '8',
                    onTap: () {
                      addAmount('8');
                    },
                  ),
                  InputButtonPin(
                    number: '9',
                    onTap: () {
                      addAmount('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  InputButtonPin(
                    number: '0',
                    onTap: () {
                      addAmount('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deleteAmount();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 24,
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/transfer-success',
                  (route) => false,
                );
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            title: 'Terms & Conditions',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
