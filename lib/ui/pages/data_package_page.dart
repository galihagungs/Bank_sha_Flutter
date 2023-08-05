import 'package:bank__sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank__sha/models/data_form_model.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../models/data_plan_model.dart';
import '../../models/operator_card_model.dart';
import '../../shared/shared_method.dart';
import '../widgets/data_package_item.dart';
import '../widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackagePage({super.key, required this.operatorCard});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selectedDataPlan!.price! * -1,
                  ),
                );
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/data-success',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
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
                CustomFormField(
                  title: 'by Username',
                  isShowTitle: false,
                  maginTextToBox: 14,
                  hint: '+628',
                  controller: phoneController,
                ),
                buildResults(context),
              ],
            ),
            floatingActionButton:
                (selectedDataPlan != null && phoneController.text.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.all(24),
                        child: CustomFilledButton(
                          title: 'Continue',
                          onPressed: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              // ignore: use_build_context_synchronously
                              final authState = context.read<AuthBloc>().state;

                              String pin = '';
                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }

                              context.read<DataPlanBloc>().add(
                                    DataPlanPost(
                                      DataPlanFormModel(
                                        id: selectedDataPlan!.id,
                                        phoneNumber: phoneController.text,
                                        pin: pin,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                      )
                    : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
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
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
                spacing: 17,
                runSpacing: 17,
                children: widget.operatorCard.dataplans!.map((dataPlan) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDataPlan = dataPlan;
                        });
                      },
                      child: DataPackageItem(
                        dataPlan: dataPlan,
                        isSelected: dataPlan.id == selectedDataPlan?.id,
                      ));
                }).toList()),
          ),
        ],
      ),
    );
  }
}
