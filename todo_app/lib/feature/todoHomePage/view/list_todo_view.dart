part of 'todos_homepage_view.dart';

class ListTodoView extends StatelessWidget {
  const ListTodoView({Key? key}) : super(key: key);
  final double elevation = 10;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCrudCubit(),
      child: BlocConsumer<TodoCrudCubit, TodoCrudState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          if (state is TodoListState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                bool isChecked = state.todos[index].completed;
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  elevation: elevation,
                  color: isChecked ? Colors.green : Colors.white,
                  child: ListTile(
                    title: Text(
                      state.todos[index].title,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            decoration: isChecked ? TextDecoration.lineThrough : null,
                            color: isChecked ? Colors.white : Colors.black,
                          ),
                    ),
                    leading: Checkbox(
                      value: state.todos[index].completed,
                      onChanged: (value) {
                        BlocProvider.of<TodoCrudCubit>(context).toggleTodo(state.todos[index]);
                      },
                    ),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: isChecked ? Colors.white : Colors.black,
                            ),
                            onPressed: () {
                              BlocProvider.of<TodoCrudCubit>(context).deleteTodo(state.todos[index]);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: isChecked ? Colors.white : Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => EditTodoView(todo: state.todos[index])));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
