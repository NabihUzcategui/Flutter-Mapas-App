import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return !state.isGpsEnable
              ? const _EnableGpsMessage()
              : const _AccessButtom();
        },
      )
          // _AccessButtom(),
          // child: _EnableGpsMessage(),
          ),
    );
  }
}

class _AccessButtom extends StatelessWidget {
  const _AccessButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso al GPS',
            style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w300)),
        MaterialButton(
          shape: const StadiumBorder(),
          color: Colors.lightGreen,
          elevation: 0,
          splashColor: Colors.transparent,
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          child: const Text(
            "Solictar acceso",
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe hablitar el GPS',
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300),
    );
  }
}
