part of 'map_page_bloc.dart';

abstract class MapPageEvent {}

class MapPageInit extends MapPageEvent {}

class MapPageMsgErr extends MapPageEvent {
  final String msg;
  MapPageMsgErr(this.msg);
}
