import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';

part 'filter_page_event.dart';
part 'filter_page_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  final DepartmentRequest requestFromPrevPage;
  FilterPageBloc({
    required PageState pageState,
    required this.requestFromPrevPage,
  }) : super(FilterPageInitial(pageState)) {
    on<FilterPageInit>(filterPageInit);
    on<FilterPageMsgErr>(filterPageMsgErr);
    on<FilterPageCheckCard>(filterPageCheckCard);
    on<FilterPageCheckIndPer>(filterPageCheckIndPer);
    on<FilterPageCheckCredit>(filterPageCheckCredit);
    on<FilterPageChangeRadius>(filterPageChangeRadius);
    on<FilterPageCheckFreeDepartments>(filterPageCheckFreeDepartments);
    on<FilterPageSubmit>(filterPageSubmit);
    add(FilterPageInit());
  }

  filterPageInit(FilterPageInit event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(
      request: requestFromPrevPage,
      cardCheck: requestFromPrevPage.service.contains(1),
      indPerCheck: requestFromPrevPage.service.contains(2),
      creditCheck: requestFromPrevPage.service.contains(3),
      sliderValue: requestFromPrevPage.radius.toDouble(),
      freeDepartments: requestFromPrevPage.accountWorkload,
    )));
  }

  filterPageCheckCard(FilterPageCheckCard event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(cardCheck: !state.pageState.cardCheck)));
  }

  filterPageCheckIndPer(FilterPageCheckIndPer event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(indPerCheck: !state.pageState.indPerCheck)));
  }

  filterPageCheckCredit(FilterPageCheckCredit event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(creditCheck: !state.pageState.creditCheck)));
  }

  filterPageChangeRadius(FilterPageChangeRadius event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(sliderValue: event.value)));
  }

  filterPageCheckFreeDepartments(FilterPageCheckFreeDepartments event, emit) async {
    emit(FilterPageUp(state.pageState.copyWith(freeDepartments: !state.pageState.freeDepartments)));
  }

  filterPageSubmit(FilterPageSubmit event, emit) async {
    List<int> listServices = [];
    if (state.pageState.cardCheck) {
      listServices.add(1);
    }
    if (state.pageState.indPerCheck) {
      listServices.add(2);
    }
    if (state.pageState.creditCheck) {
      listServices.add(3);
    }
    var request = state.pageState.request.copyWith(
        service: listServices,
        radius: state.pageState.sliderValue.toInt(),
        accountWorkload: state.pageState.freeDepartments);
    emit(FilterPageAllowedToPop(state.pageState.copyWith(request: request)));
  }

  filterPageMsgErr(FilterPageMsgErr event, emit) async {
    emit(FilterPageError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(FilterPageMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
