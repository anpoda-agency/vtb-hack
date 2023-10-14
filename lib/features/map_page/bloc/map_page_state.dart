// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_page_bloc.dart';

abstract class MapPageState {
  final PageState pageState;
  const MapPageState(this.pageState);
}

class MapPageInitial extends MapPageState {
  const MapPageInitial(PageState pageState) : super(pageState);
}

class MapPageUpdateMap extends MapPageState {
  const MapPageUpdateMap(PageState pageState) : super(pageState);
}

class MapPageUp extends MapPageState {
  const MapPageUp(PageState pageState) : super(pageState);
}

class MapPageError extends MapPageState {
  const MapPageError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DepartmentRequest request;
  final List<DepartmentResponse> response;

  const PageState({
    this.onAwait = false,
    this.request = const DepartmentRequest(),
    this.response = const [],
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DepartmentRequest? request,
    List<DepartmentResponse>? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
