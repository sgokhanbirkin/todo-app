part of 'todos_homepage_view.dart';

// ignore: must_be_immutable
class EditTodoView extends StatelessWidget {
  EditTodoView({Key? key, required this.todo}) : super(key: key);
  TodoModel todo;
  TextEditingController textController = TextEditingController();
  final String data = 'Edit Todo';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCrudCubit(),
      child: BlocConsumer<TodoCrudCubit, TodoCrudState>(
        listener: (context, state) {
          // ignore: todo
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(data),
            ),
            body: Padding(
              padding: context.paddingLow,
              child: Form(
                child: TodoAddTextFormFieldWidget(
                  textController: textController,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<TodoCrudCubit>(context).editTodo(textController.text, todo);
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => const TodosHomePageView()), (route) => false);
              },
              child: const Icon(Icons.edit),
            ),
          );
        },
      ),
    );
  }
}
