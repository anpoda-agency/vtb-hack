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
    on<MapPageMsgErr>(mapPageMsgErr);
    add(MapPageInit());
  }

  mapPageInit(MapPageInit event, emit) async {
    emit(MapPageUp(state.pageState.copyWith(onAwait: true)));
    var startRequest = const DepartmentRequest(
        longitude: 51.529644,
        latitude: 46.051234,
        radius: 150,
        service: [1, 2, 3],
        workload: 0,
        accountWorkload: false);
    var res = await mapRepository.getDepartments(request: startRequest);
    emit(MapPageUp(state.pageState.copyWith(onAwait: false, response: res)));
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
