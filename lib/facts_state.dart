part of 'facts_cubit.dart';

@immutable
abstract class FactsState {}

class FactsInitial extends FactsState {}

class FactsLoading extends FactsState {}

class FactsSuccess extends FactsState {}

class FactsError extends FactsState {}

class ChangeChoise extends FactsState {}

class AskState extends FactsState {}
