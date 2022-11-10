import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/cubit/cubit.dart';
import 'package:mans/shared/cubit/states.dart';

class ArchiveTasksScreen extends StatelessWidget {
  const ArchiveTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks);},
    );
  }
}
