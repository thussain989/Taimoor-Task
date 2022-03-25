import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taimoor_task/cubit/shopping_cubit.dart';
import 'package:taimoor_task/strings/app_strings.dart';
import 'package:taimoor_task/widgets/suggestion_tile.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late ShoppingCubit shoppingCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 100.0) {
        if (shoppingCubit.state is SuggestionsFetched) {
          shoppingCubit.fetchMoreSuggestion();
        }
      }
    });
    shoppingCubit = BlocProvider.of<ShoppingCubit>(context);
    shoppingCubit.fillInitialList(
      [
        'ronaldo',
        'benzema',
        'lewadonski',
        'messi',
        'neymar',
        'ramos',
        'ronaldo',
        'salah',
        'messi',
        'lewadonski'
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          elevation: 1,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            AppStrings.shopping,
          ),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   centerTitle: true,
      //   title: const Text(
      //     AppStrings.shopping,
      //   ),
      //   titleTextStyle: const TextStyle(
      //       color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.searchResult,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "About ${shoppingCubit.suggestionList.length.toString()}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Stack(
                        children: [
                          GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 3 / 4,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              maxCrossAxisExtent: 200,
                            ),
                            itemCount: shoppingCubit.suggestionList.length,
                            itemBuilder: (context, index) {
                              return SuggestionTile(
                                name: shoppingCubit.suggestionList[index],
                                index: index,
                              );
                            },
                          ),
                          if (state is FetchingMoreSuggestions)
                            Container(
                              color: Colors.transparent,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
