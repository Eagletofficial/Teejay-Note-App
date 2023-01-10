import 'package:flutter/material.dart';

class NoteBody extends StatefulWidget {
  const NoteBody({Key? key}) : super(key: key);

  @override
  State<NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  List<String> todo = [];
  List<String> subT = [];

  String input = '';
  String output = '';
  String text = '';
  String exam = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NOTE APP'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Note'),
                  content: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          input = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        maxLength: 200,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          hintText: 'Content',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          todo.add(input);
                          subT.add(output);
                        });
                        Navigator.pop(context);
                      }),
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xffFFCC80),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text(
                        todo[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      subtitle: Text(
                        subT[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      trailing: Container(
                        width: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: (() {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Column(
                                            children: [
                                              TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Title',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    text = value;
                                                  });
                                                },
                                              ),
                                              const SizedBox(height: 10),
                                              TextField(
                                                maxLength: 200,
                                                maxLines: 6,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Content',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    exam = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: ElevatedButton(
                                            onPressed: (() {
                                              setState(() {
                                                todo[index] = text;
                                                subT[index] = exam;
                                              });
                                              Navigator.pop(context);
                                            }),
                                            child: const Text(
                                              'Update',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                icon:
                                    const Icon(Icons.edit, color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: (() {
                                  setState(() {
                                    todo.removeAt(index);
                                    subT.removeAt(index);
                                  });
                                }),
                                icon: const Icon(Icons.delete,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Text(
                        '12/1/2023',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
