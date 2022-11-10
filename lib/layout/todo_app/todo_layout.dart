import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/cubit/cubit.dart';
import 'package:mans/shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, TodoStates>(
        listener: (BuildContext context, state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                condition: state is! AppGetDatabaseLoadingState),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShow) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDatabase(
                        date: dateController.text,
                        time: timeController.text,
                        title: titleController.text);
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                          (context) => SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultFormField(
                                          prefixIcon: Icons.title,
                                          controller: titleController,
                                          type: TextInputType.text,
                                          label: 'Text Title',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'title must be not empty';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        defaultFormField(
                                          prefixIcon:
                                              Icons.watch_later_outlined,
                                          controller: timeController,
                                          type: TextInputType.datetime,
                                          label: 'Time Title',
                                          onTap: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              timeController.text =
                                                  value!.format(context);
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'time must be not empty';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        defaultFormField(
                                          prefixIcon: Icons.date_range_outlined,
                                          controller: dateController,
                                          type: TextInputType.datetime,
                                          label: 'Date Title',
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2030),
                                            ).then((value) {
                                              dateController.text =
                                                  '${value!.day}/${value.month}/${value.year}';
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Date must be not empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          elevation: 20)
                      .closed
                      .then((value) {
                    cubit.iconChange(isShow: false, icon: Icons.edit);
                  });
                  cubit.iconChange(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive'),
              ],
            ),
          );
        },
      ),
    );
  }
}


// ConditionalBuilder(
// builder: (context) => cubit.screens[cubit.currentIndex],
// fallback: (context) => const Center(
// child: CircularProgressIndicator(),
// ),
// condition: true)