import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2/Blocs/users_bloc/users_bloc.dart';
import 'package:flutter_2/screen/create_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateUser()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (context) => UsersBloc()..add(GetUsersDataEvent()),
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoadingState) {
                return Text(state.message);
              } else if (state is UsersLoadFailedState) {
                return Text(state.error);
              } else if (state is UsersLoadedState) {
                return ListView.builder(
                  itemCount: state.userData.results.length,
                  itemBuilder: (context, index) {
                    final user = state.userData.results[index];

                    return ListTile(
                      leading: Image.network("${user!.picture.large}"),
                      title: Text(
                          "${user.name.title} ${user.name.first} ${user.name.last}"),
                      subtitle: Text(user.location.country!),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
