import 'package:facts_app/api/api_manager.dart';

import 'package:facts_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facts_state.dart';

class FactsCubit extends Cubit<FactsState> {
  FactsCubit() : super(FactsInitial());

  String choise = AppStrings.yearHint;
  String subTitle = AppStrings.year;

  String? fact;
  TextEditingController textfield = TextEditingController();

  static FactsCubit get(context) => BlocProvider.of(context);

  Future<void> getFact() async {
    emit(FactsLoading());
    if (choise == AppStrings.yearHint) {
      try {
        var limit = 1;
        if (textfield.text.trim().isNotEmpty) {
          limit = int.parse(textfield.text);
        }

        fact = await ApiManager.getFact(limit: limit);

        emit(FactsSuccess());
      } catch (e) {
        emit(FactsError());
        debugPrint(e.toString());
        throw (Exception);
      }
    } else if (choise == AppStrings.numberHint) {
      try {
        String data = await ApiManager.getNumberFact(number: textfield.text);
        fact = data;
        emit(FactsSuccess());
      } catch (e) {
        emit(FactsError());
        throw (Exception);
      }
    } else if (choise == AppStrings.dateHint) {
      try {
        String data = await ApiManager.getDateFact(date: textfield.text);
        fact = data;
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
