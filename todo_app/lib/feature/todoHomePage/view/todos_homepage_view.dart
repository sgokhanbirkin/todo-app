import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/model/todo_model.dart';
import 'package:todo_app/feature/todoHomePage/viewModel/todo_crud_cubit.dart';
import 'package:todo_app/widgets/todo_add_text_form_field_widget.dart';

part 'add_todo_view.dart';
part 'edit_todo_view.dart';
part 'list_todo_view.dart';

class TodosHomePageView extends StatefulWidget {
  const TodosHomePageView({Key? key}) : super(key: key);

  @override
  State<TodosHomePageView> createState() => _TodosHomePageViewState();
}

class _TodosHomePageViewState extends State<TodosHomePageView> {
  TodoCrudState cubitState = TodoCrudState.initial();
  final String data = 'Unknown state';
  final String title = 'Todo App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => TodoCrudCubit(),
        child: BlocConsumer<TodoCrudCubit, TodoCrudState>(
          listener: ((context, state) {
            setState(() {
              cubitState = state;
            });
          }),
          builder: (context, state) {
            if (state is TodoListState) {
              return const ListTodoView();
            } else {
              return Text(data);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTodoView()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
