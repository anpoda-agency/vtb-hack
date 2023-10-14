part of 'filter_page_bloc.dart';

abstract class FilterPageEvent {}

class FilterPageInit extends FilterPageEvent {}

class FilterPageCheckCard extends FilterPageEvent {}

class FilterPageCheckIndPer extends FilterPageEvent {}

class FilterPageCheckCredit extends FilterPageEvent {}

class FilterPageChangeRadius extends FilterPageEvent {
  final double value;
  FilterPageChangeRadius(this.value);
}

class FilterPageCheckFreeDepartments extends FilterPageEvent {}

class FilterPageSubmit extends FilterPageEvent {}

class FilterPageMsgErr extends FilterPageEvent {
  final String msg;
  FilterPageMsgErr(this.msg);
}
