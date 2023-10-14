// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_page_bloc.dart';

abstract class FilterPageState {
  final PageState pageState;
  const FilterPageState(this.pageState);
}

class FilterPageInitial extends FilterPageState {
  const FilterPageInitial(PageState pageState) : super(pageState);
}

class FilterPageUp extends FilterPageState {
  const FilterPageUp(PageState pageState) : super(pageState);
}

class FilterPageAllowedToPop extends FilterPageState {
  const FilterPageAllowedToPop(PageState pageState) : super(pageState);
}

class FilterPageError extends FilterPageState {
  const FilterPageError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final bool cardCheck;
  final bool creditCheck;
  final bool indPerCheck;
  final bool freeDepartments;
  final double sliderValue;
  final DepartmentRequest request;

  const PageState(
      {this.onAwait = false,
      this.errMsg = '',
      this.cardCheck = false,
      this.creditCheck = false,
      this.indPerCheck = false,
      this.freeDepartments = false,
      this.sliderValue = 1,
      this.request = const DepartmentRequest()});

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    bool? cardCheck,
    bool? creditCheck,
    bool? indPerCheck,
    bool? freeDepartments,
    double? sliderValue,
    DepartmentRequest? request,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      cardCheck: cardCheck ?? this.cardCheck,
      creditCheck: creditCheck ?? this.creditCheck,
      indPerCheck: indPerCheck ?? this.indPerCheck,
      freeDepartments: freeDepartments ?? this.freeDepartments,
      sliderValue: sliderValue ?? this.sliderValue,
      request: request ?? this.request,
    );
  }
}
