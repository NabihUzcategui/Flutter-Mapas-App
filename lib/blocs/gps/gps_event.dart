part of 'gps_bloc.dart';

sealed class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsPermissionEvent extends GpsEvent {
  final bool isGpsEnable;
  final bool isGpsPermissionGranted;

  const GpsPermissionEvent({
    required this.isGpsEnable,
    required this.isGpsPermissionGranted,
  });
}
