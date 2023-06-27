import 'package:crud/models/user.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 96,
        child: Row(children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.userForm, arguments: user);
              },
              icon: const Icon(Icons.edit, color: Colors.orange)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red)),
        ]),
      ),
    );
  }
}
