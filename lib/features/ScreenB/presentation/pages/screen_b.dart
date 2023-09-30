import 'package:bloc_sample_1/navigation/navigation_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/screenb_bloc.dart';

class ScreenB extends StatefulWidget {
  final String data;
  final AppRoutes appRoutes;
  const ScreenB({super.key, required this.data, required this.appRoutes});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ScreenbBloc>().add(ScreenBInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ScreenbBloc, ScreenbState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Text(widget.data),
          );
        },
      ),
    );
  }
}
