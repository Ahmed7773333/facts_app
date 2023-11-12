import 'package:facts_app/api/api_manager.dart';

import 'package:facts_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facts_state.dart';

class FactsCubit extends Cubit<FactsState> {
  FactsCubit() : super(FactsInitial());

  String choise = AppStrings.planetHint;
  String subTitle = AppStrings.country;

  String? fact;
  TextEditingController textfield = TextEditingController();

  static FactsCubit get(context) => BlocProvider.of(context);

  Future<void> getFact() async {
    emit(FactsLoading());
    if (choise == AppStrings.countryrHint) {
      try {
        String country = 'Egypt';
        if (textfield.text.trim().isNotEmpty) {
          country = textfield.text;
        }

        fact = await ApiManager.getCountryFact(country: country);
        fact = fact?.split(',').join('\n');
        emit(FactsSuccess());
      } catch (e) {
        emit(FactsError());
        debugPrint(e.toString());
        throw (Exception);
      }
    } else if (choise == AppStrings.carHint) {
      try {
        String data = await ApiManager.getCarFact(car: textfield.text);
        fact = data;
        fact = fact?.split(',').join('\n');

        emit(FactsSuccess());
      } catch (e) {
        emit(FactsError());
        throw (Exception);
      }
    } else if (choise == AppStrings.planetHint) {
      String country = 'Earth';
      if (textfield.text.trim().isNotEmpty) {
        country = textfield.text;
      }
      try {
        String data = await ApiManager.getPlanetFact(planet: country);
        fact = data;
        fact = fact?.split(',').join('\n');

        emit(FactsSuccess());
      } catch (e) {
        emit(FactsError());
        throw (Exception);
      }
    }
  }

  void changeChoise({required String chois, required String subTit}) {
    emit(FactsInitial());
    choise = chois;
    subTitle = subTit;

    emit(ChangeChoise());
  }

  void asked() {
    emit(FactsInitial());
    debugPrint('working');
    emit(AskState());
  }
}
