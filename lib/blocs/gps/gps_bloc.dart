import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc()
      : super(
          const GpsState(
            isGpsEnable: false,
            isGpsPermissionGranted: false,
          ),
        ) {
    on<GpsPermissionEvent>(
      (event, emit) => emit(
        state.copyWith(
          isGpsEnable: event.isGpsEnable,
          isGpsPermissionGranted: event.isGpsPermissionGranted,
        ),
      ),
    );
    _inint();
  }

  Future<void> _inint() async {
    final isEnable = await _checkGpsStatus();
    print('isEnable: $isEnable');
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    Geolocator.getServiceStatusStream().listen(
      (event) {
        final isEnable = (event.index == 1) ? true : false;
        print('Service status $isEnable ');
      },
    );

    return isEnable;
  }

  @override
  Future<void> close() {
    // TODO: Limpiar el service status string
    return super.close();
  }
}
