import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/schedule_model.dart';
import 'package:test/domain/location_service.dart';
import 'package:test/domain/provider/schedule_provider.dart';
import 'package:test/presentation/new_schedule/new_schedule_view.dart';
import 'package:test/presentation/new_schedule/widgets/schedule_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final location = LocationService();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final auth = context.read<ScheduleProvider>();

      location.determinePosition(context);
      auth.getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const NewScheduleView(),
          ));
        },
      ),
      appBar: AppBar(
        title: const Text('Agendamiento de canchas'),
      ),
      body: Consumer<ScheduleProvider>(
        builder: (context, scheduleService, index) {
          List<ScheduleModel> scheduleList = scheduleService.scheduleList;

          return scheduleList.isEmpty
              ? const Center(
                  child: Text('Agende una fecha'),
                )
              : ListView.builder(
                  itemCount: scheduleList.length,
                  itemBuilder: (context, index) {
                    ScheduleModel schedule = scheduleList[index];

                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: ScheduleCard(
                        schedule: schedule,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
