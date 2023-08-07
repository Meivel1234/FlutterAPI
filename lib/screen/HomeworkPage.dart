import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/enotice_bloc/homework_bloc.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homework")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: BlocProvider(
            create: (context) => HomeworkBloc()..add(GetHomeworkEvent()),
            child: BlocBuilder<HomeworkBloc, HomeworkState>(
                builder: (context, state) {
              if (state is HomeworkLoadingState) {
                return Text(state.message);
              } else if (state is HomeworkFailedState) {
                return Text(state.error);
              } else if (state is HomeworkLoadedState) {
                return ListView.builder(
                  itemCount: state.hwData.length,
                  itemBuilder: (context, index) {
                    final homework = state.hwData[index];
                    return ListTile(
                      title:
                          Text("${homework.createdBy} ${homework.subjectName}"),
                      subtitle: Text(homework.hwDescription),
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
