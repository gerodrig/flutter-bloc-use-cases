import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/config/helpers/random_generator.dart';

import 'package:bloc_app/presentation/blocs/blocs.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context
              .read<GuestsBloc>()
              .add(AddGuest(RandomGenerator.getRandomName()));
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestBloc = context.watch<GuestsBloc>();
    final selectedFilter = guestBloc.state.filter;

    return Column(
      children: [
        const ListTile(
          title: Text('Guests List'),
          subtitle: Text(
              'This is a list of guests that will be invited to the party'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invited')),
            ButtonSegment(
                value: GuestFilter.notInvited, icon: Text('Not Invited')),
          ],
          selected: <GuestFilter>{selectedFilter},
          onSelectionChanged: (value) {
            guestBloc.changeFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestBloc.state.filteredGuests.length,
            itemBuilder: (context, index) {
              final guest = guestBloc.state.filteredGuests[index];

              return SwitchListTile(
                  title: Text(guest.description),
                  value: guest.done,
                  onChanged: (value) {
                    guestBloc.toggleGuest(guest.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
