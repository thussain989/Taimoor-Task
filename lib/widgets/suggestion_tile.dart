import 'package:flutter/material.dart';

class SuggestionTile extends StatefulWidget {
  const SuggestionTile({Key? key, required this.name, required this.index})
      : super(key: key);
  final String name;
  final int index;
  @override
  _SuggestionTileState createState() => _SuggestionTileState();
}

class _SuggestionTileState extends State<SuggestionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/${widget.name}.jpeg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: widget.index % 2 == 0
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/${widget.name}.jpeg',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    widget.name.replaceFirst(
                        widget.name[0], widget.name[0].toUpperCase()),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
