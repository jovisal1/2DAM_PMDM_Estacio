import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_architecture/presentation/blocs/characters/characters_bloc.dart';
import 'package:flutter_harry_potter_clean_architecture/presentation/blocs/characters/characters_event.dart';
import 'package:flutter_harry_potter_clean_architecture/presentation/blocs/characters/characters_state.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {
  String _filter = '';

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(LoadCharactersEvent(_filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes de Harry Potter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _filter = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Filtrar por nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<CharacterBloc>()
                        .add(LoadCharactersEvent(_filter));
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                // Mostrar el indicador de carga mientras isLoading sea true
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Mostrar mensaje de error si hay uno
                else if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                }
                // Mostrar la lista de personajes
                else if (state.characters.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      final character = state.characters[index];
                      return ListTile(
                        leading: Image.network(character.image),
                        title: Text(
                            "${character.name} - ${character.wand.core}: ${character.wand.length}"),
                        subtitle: Text(character.house),
                      );
                    },
                  );
                }
                // Si no hay personajes, mostrar un mensaje vacío
                else {
                  return const Center(
                      child: Text(
                          'No hay personajes que coincidan con el filtro.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
