import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';
import 'package:vtb_hack/data/models/offers/department_response.dart';
import 'package:vtb_hack/domain/repository/map_repository.dart';

part 'map_page_event.dart';
part 'map_page_state.dart';

class MapPageBloc extends Bloc<MapPageEvent, MapPageState> {
  final MapRepository mapRepository;

  MapPageBloc({
    required PageState pageState,
    required this.mapRepository,
  }) : super(MapPageInitial(pageState)) {
    on<MapPageInit>(mapPageInit);
    on<MapPageLoadDepartments>(mapPageLoadDepartments);
    on<MapPageMsgErr>(mapPageMsgErr);
    on<MapPageLoadUpdateFilter>(mapPageLoadUpdateFilter);
    add(MapPageInit());
  }

  mapPageInit(MapPageInit event, emit) async {
    var startRequest = const DepartmentRequest(
      radius: 50,
      service: [0],
      accountWorkload: false,
    );
    emit(MapPageUp(state.pageState.copyWith(request: startRequest)));
  }

  mapPageLoadDepartments(MapPageLoadDepartments event, emit) async {
    var request = state.pageState.request.copyWith(latitude: event.lat, longitude: event.long);
    var res = await mapRepository.getDepartments(request: request);
    emit(MapPageUp(state.pageState.copyWith(onAwait: false, response: res, request: request)));
  }

  mapPageLoadUpdateFilter(MapPageLoadUpdateFilter event, emit) async {
    emit(MapPageUp(state.pageState.copyWith(onAwait: true, request: event.value)));
    var res = await mapRepository.getDepartments(request: state.pageState.request);
    emit(MapPageUpdateMap(state.pageState.copyWith(onAwait: false, response: res)));
  }

  mapPageMsgErr(MapPageMsgErr event, emit) async {
    emit(MapPageError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(MapPageMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
