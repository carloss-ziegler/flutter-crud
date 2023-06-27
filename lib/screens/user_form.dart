import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'] as String,
                    email: _formData['email'] as String,
                    avatarUrl: _formData['avatarUrl'] as String,
                  ),
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => _formData['name'] = value as String,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _formData['email'] = value as String,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL da imagem'),
                  onSaved: (value) => _formData['avatarUrl'] = value as String,
                ),
              ],
            )),
      ),
    );
  }
}
