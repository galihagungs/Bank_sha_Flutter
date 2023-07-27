import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/data_package_item.dart';
import '../widgets/forms.dart';
import '../widgets/transfer_recent_user_item.dart';
import '../widgets/transfer_search_user_item.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          const CustomFormField(
            title: 'by Username',
            isShowTitle: false,
            maginTextToBox: 14,
            hint: '+628',
          ),
          buildResults(context),
        ],
      ),
    );
  }
}

Widget buildResults(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Package',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              DataPackageItem(
                title: '10GB',
                price: 'Rp 218.000',
                isSelected: false,
              ),
              DataPackageItem(
                title: '25GB',
                price: 'Rp 420.000',
                isSelected: false,
              ),
              DataPackageItem(
                title: '40GB',
                price: 'Rp 2.500.000',
                isSelected: true,
              ),
              DataPackageItem(
                title: '99GB',
                price: 'Rp 5.000.000',
                isSelected: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 85,
        ),
        CustomFilledButton(
          title: 'Continue',
          onPressed: () async {
            if (await Navigator.pushNamed(context, '/pin') == true) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/data-success',
                (route) => false,
              );
            }
          },
        ),
      ],
    ),
  );
}