part of 'map_page_bloc.dart';

abstract class MapPageEvent {}

class MapPageInit extends MapPageEvent {}

class MapPageLoadDepartments extends MapPageEvent {
  final double lat;
  final double long;
  MapPageLoadDepartments({required this.lat, required this.long});
}

class MapPageLoadUpdateFilter extends MapPageEvent {
  final DepartmentRequest value;
  MapPageLoadUpdateFilter({required this.value});
}

class MapPageMsgErr extends MapPageEvent {
  final String msg;
  MapPageMsgErr(this.msg);
}
