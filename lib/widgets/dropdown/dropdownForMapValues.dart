import '../../globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/mapValues.dart';

class MapDropdown extends StatefulWidget {
  final String name;
  MapDropdown(this.name);
  @override
  State<MapDropdown> createState() => _MapDropdownState();
}

class _MapDropdownState extends State<MapDropdown> {
  List data = [];
  int index = 0;
  List dataDeneme = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    switch (widget.name) {
      case 'City':
        await Provider.of<MapValues>(context, listen: false).setAllCities();

        break;
      case 'District':
        await Provider.of<MapValues>(context, listen: false).setAllDistricts();

        break;
      case 'Neighbourhood':
        await Provider.of<MapValues>(context, listen: false)
            .setAllNeighbourhoods();

        break;
    }
  }

  selectedItem() {
    switch (widget.name) {
      case 'City':
        return Provider.of<MapValues>(context).getSelectedCity;
      case 'District':
        return Provider.of<MapValues>(context).getSelectedDistrict;
      case 'Neighbourhood':
        return Provider.of<MapValues>(context).getSelectedNeighbourhood;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapValues>(builder: (context, value, child) {
      return Container(
          margin: EdgeInsets.only(top: 25),
          child: PopupMenuButton(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    color: widget.name == 'District'
                        ? value.getDistricts.length == 0
                            ? Colors.black38
                            : Colors.transparent
                        : widget.name == 'Neighbourhood'
                            ? value.getNeighbourhoods.length == 0
                                ? Colors.black38
                                : Colors.transparent
                            : Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            selectedItem(),
                            style: TextStyle(fontSize: 14.0, color: blackColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.list),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: 2,
                    color: blackColor,
                  ),
                ],
              ),

              //color: Colors.black,
              //position: PopupMenuPosition.under,
              //offset: Offset(-30, 0),
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)

              itemBuilder: (context) {
                //print(value.getNeighbourhoods);
                int count = -1;
                switch (widget.name) {
                  case 'City':
                    return value.getCities
                        .map(
                          (e) => PopupMenuItem(
                            value: ++count,
                            child: Text(e),
                          ),
                        )
                        .toList();

                  case 'District':
                    return value.getDistricts
                        .map(
                          (e) => PopupMenuItem(
                            value: ++count,
                            child: Text(e),
                          ),
                        )
                        .toList();
                }
                //case 'Neighbourhood':

                return widget.name == 'City'
                    ? value.getCities
                        .map(
                          (e) => PopupMenuItem(
                            value: ++count,
                            child: Text(e),
                          ),
                        )
                        .toList()
                    : widget.name == 'District '
                        ? value.getDistricts
                            .map(
                              (e) => PopupMenuItem(
                                value: ++count,
                                child: Text(e),
                              ),
                            )
                            .toList()
                        : value.getNeighbourhoods
                            .map(
                              (e) => PopupMenuItem(
                                value: ++count,
                                child: Text(e),
                              ),
                            )
                            .toList(); /*dataDeneme
                .map(
                  (e) => PopupMenuItem(
                    value: ++count,
                    child: Text(e),
                  ),
                )
                .toList();*/
                //return '';
              },
              onSelected: (value) {
                switch (widget.name) {
                  case 'City':
                    Provider.of<MapValues>(context, listen: false)
                        .selectCity(value);
                    Provider.of<MapValues>(context, listen: false)
                        .selectDistrict(0);
                    Provider.of<MapValues>(context, listen: false)
                        .selectNeighbourhood(0);
                    /*Provider.of<MapValues>(context, listen: false)
                    .setAllDistricts();*/

                    break;
                  case 'District':
                    Provider.of<MapValues>(context, listen: false)
                        .selectDistrict(value);
                    Provider.of<MapValues>(context, listen: false)
                        .selectNeighbourhood(0);

                    break;
                  case 'Neighbourhood':
                    Provider.of<MapValues>(context, listen: false)
                        .selectNeighbourhood(value);
                    break;
                }
                //Provider.of<MapValues>(context, listen: false).index = value as int;
              }));
    });
  }
}
