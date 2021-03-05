import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_application/Blocs/AnimatorBloc.dart';
import 'package:intern_application/Screens/CourseScreen.dart';

class RepositoryScreen extends StatefulWidget {
  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  ToggleAnimationBloc _animationBloc;
  double pageWidth;
  double pageHeight;
  List<Map<String, String>> _listItems;
  @override
  void initState() {
    _animationBloc = ToggleAnimationBloc();
    _listItems = List();
    populateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.blue[500],
            elevation: 16,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                ),
                BlocBuilder<ToggleAnimationBloc, ToggleAnimationState>(
                  cubit: _animationBloc,
                  builder: (context, state) {
                    return getSearchWidget(state.isExpanded);
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Browse Courses",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildListTile(index);
              },
              childCount: _listItems.length,
            ),
          ),
        ],
      ),
    );
  }

  void populateList() {
    _listItems.add(
      {
        'Title': "Course 1",
        "subTitle": "Course on evolution of humans in the last century"
      },
    );
    _listItems.add(
      {
        'Title': "Course 2",
        "subTitle":
            "Course on Artificial Intelligence and its future applications"
      },
    );
    _listItems.add(
      {
        'Title': "Course 3",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 4",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 5",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 6",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 7",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 8",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 9",
        "subTitle": "Course on building a business from scratch",
      },
    );
    _listItems.add(
      {
        'Title': "Course 10",
        "subTitle": "Course on building a business from scratch",
      },
    );
  }

  Widget _buildListTile(int indx) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          _listItems[indx]['Title'],
        ),
        subtitle: Text(
          _listItems[indx]['subTitle'],
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseScreen(
                title: _listItems[indx]['Title'],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getSearchWidget(bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: SizedBox(
        width: pageWidth / 2,
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 500),
          tween: Tween<double>(
            begin: isExpanded ? 1 : 0,
            end: isExpanded ? 0 : 1,
          ),
          builder: (context, value, child) {
            if (!isExpanded)
              return Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _animationBloc.add(ToggleAnimationEvent()),
                ),
              );

            return Padding(
              padding: EdgeInsets.only(left: value * pageWidth),
              child: TextField(
                style: TextStyle(color: Colors.blue[900]),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.blue[800],
                    ),
                    onPressed: () {
                      getSearchResult();
                    },
                  ),
                ),
                onSubmitted: (value) {
                  _animationBloc.add(ToggleAnimationEvent());
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void getSearchResult() {}
}
