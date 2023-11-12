import 'package:facts_app/facts_cubit.dart';
import 'package:facts_app/utils/app_strings.dart';
import 'package:facts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class FactScreen extends StatelessWidget {
  GlobalKey<FormState> kkey = GlobalKey<FormState>();
  Widget containerWidget = const Center(
    child: Icon(
      Icons.fact_check,
      color: Color(0xFFFE7D07),
      size: 50,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactsCubit()..getFact(),
      child: BlocConsumer<FactsCubit, FactsState>(
        listener: (context, state) {
          if (state is FactsLoading) {
            containerWidget = const Center(
              child: CircularProgressIndicator(),
            );
            debugPrint('loading...');
          } else if (state is FactsError) {
            containerWidget = Center(
              child: Icon(
                Icons.error,
                size: 30.r,
                color: Colors.red,
              ),
            );
            debugPrint('error');
          } else if (state is FactsSuccess) {
            containerWidget = SingleChildScrollView(
                child: Text(FactsCubit.get(context).fact ?? 'invalid input'));
            FactsCubit.get(context).textfield.clear();
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
                    child: containerWidget,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        bloc.changeChoise(
                            chois: AppStrings.carHint, subTit: AppStrings.car);
                      },
                      child: Center(
                        child: Text(AppStrings.carButton,
                            style: AppTheme.buttonStyle),
                      ),
                    ),
                    FilledButton(
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        bloc.changeChoise(
                            chois: AppStrings.planetHint,
                            subTit: AppStrings.planet);
                      },
                      child: Center(
                        child: Text(AppStrings.planetButton,
                            style: AppTheme.buttonStyle),
                      ),
                    ),
                    FilledButton(
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        bloc.changeChoise(
                            chois: AppStrings.countryrHint,
                            subTit: AppStrings.country);
                      },
                      child: Center(
                        child: Text(AppStrings.countryButton,
                            style: AppTheme.buttonStyle),
                      ),
                    ),
                  ],
                ),
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
