import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/enotice_bloc/homework_bloc.dart';

class EnoticePage extends StatefulWidget {
  const EnoticePage({super.key});

  @override
  State<EnoticePage> createState() => _EnoticePageState();
}

class _EnoticePageState extends State<EnoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enotice")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: BlocProvider(
            create: (context) => HomeworkBloc()..add(GetEnoticeEvent()),
            child: BlocBuilder<HomeworkBloc, HomeworkState>(
                builder: (context, state) {
              if (state is EnoticeLoadingState) {
                return Text(state.message);
              } else if (state is EnoticeFailedState) {
                return Text(state.error);
              } else if (state is EnoticeLoadedState) {
                return ListView.builder(
                  itemCount: state.enoticeData.length,
                  itemBuilder: (context, index) {
                    final enotice = state.enoticeData[index];
                    return ListTile(
                      // leading: Image.network("${user!.picture.large}"),
                      title: Text("${enotice.createdBy} ${enotice.sendDate}"),
                      subtitle: Text(enotice.description!),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            })),
      ),
    );
  }
}
