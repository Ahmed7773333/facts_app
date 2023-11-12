import 'package:facts_app/facts_cubit.dart';
import 'package:facts_app/utils/app_strings.dart';
import 'package:facts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class FactScreen extends StatelessWidget {
  GlobalKey<FormState> kkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactsCubit()..getFact(),
      child: BlocConsumer<FactsCubit, FactsState>(
        listener: (context, state) {
          if (state is FactsLoading) {
            debugPrint('loading...');
          } else if (state is FactsError) {
            debugPrint('error');
          } else if (state is FactsSuccess) {
            debugPrint('working...');
          } else if (state is ChangeChoise) {
            debugPrint('changed...');
          } else if (state is AskState) {
            FactsCubit.get(context).getFact();
            debugPrint('Asked...');
          }
        },
        builder: (context, state) {
          final bloc = FactsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.title),
            ),
            body: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enter a number of facts', style: AppTheme.subTitleStyle),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.r),
                    topRight: Radius.circular(18.r),
                  ),
                  child: Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.color ??
                            Colors.white,
                        width: 3,
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: Text(bloc.fact ?? 'invalid input')),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     FilledButton(
                //       style:
                //           FilledButton.styleFrom(backgroundColor: Colors.white),
                //       onPressed: () {
                //         bloc.changeChoise(
                //             chois: AppStrings.dateHint,
                //             subTit: AppStrings.date);
                //       },
                //       child: Center(
                //         child: Text(AppStrings.dateButton,
                //             style: AppTheme.buttonStyle),
                //       ),
                //     ),
                //     FilledButton(
                //       style:
                //           FilledButton.styleFrom(backgroundColor: Colors.white),
                //       onPressed: () {
                //         bloc.changeChoise(
                //             chois: AppStrings.yearHint,
                //             subTit: AppStrings.year);
                //       },
                //       child: Center(
                //         child: Text(AppStrings.yearButton,
                //             style: AppTheme.buttonStyle),
                //       ),
                //     ),
                //     FilledButton(
                //       style:
                //           FilledButton.styleFrom(backgroundColor: Colors.white),
                //       onPressed: () {
                //         bloc.changeChoise(
                //             chois: AppStrings.numberHint,
                //             subTit: AppStrings.number);
                //       },
                //       child: Center(
                //         child: Text(AppStrings.numberButton,
                //             style: AppTheme.buttonStyle),
                //       ),
                //     ),
                //   ],
                // ),
                TextFormField(
                  controller: bloc.textfield,
                  decoration: InputDecoration(
                      hintText: bloc.choise,
                      suffixIcon: InkWell(
                        onTap: () {
                          bloc.asked();
                        },
                        child: Icon(
                          Icons.send,
                          size: 24.r,
                          color: const Color(0xFFFE7D07),
                        ),
                      )),
                  onFieldSubmitted: (value) {
                    bloc.asked();
                  },
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
