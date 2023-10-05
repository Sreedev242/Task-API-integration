import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/Application/bloc/home_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGroup = '';
  bool isnotClicked=true;
 
@override
 
  @override
  Widget build(BuildContext context) {
    
    context.read<HomeBlocBloc>().add(HomeBlocEvent.started());
    context.read<HomeBlocBloc>().add(HomeBlocEvent.buttonBuild());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 121, 166),
        title: Text(
          'Cards',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<HomeBlocBloc, HomeBlocState>(
              builder: (context, state) {
                return Container(
                  height: 35, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.buttonlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: ElevatedButton(
                          
                          onPressed: () {
                            setState(() {
                              isnotClicked=false;
                              selectedGroup = state.buttonlist[index];
                            });
                          },
                          child: Text(state.buttonlist[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.pink,
                      ),
                    );
                  }

                  final List filteredList =isnotClicked?state.resList: state.resList
                      .where(
                          (element) => element['parent_group'] == selectedGroup)
                      .toList();
                  return GridView.builder(
                    itemCount: filteredList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      final width = MediaQuery.of(context).size.width;
                      final height = MediaQuery.of(context).size.height;
                      return Column(
                        children: [
                          Container(
                            width: width * 1 / 3.5,
                            height: height * 1 / 4,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            filteredList[index]['item_name'],
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
