import '../../../../core/resources/asset_manager.dart';

class Report {
  String id;
  String name;
  String iconAddress;
  String value;

  Report({
    required this.id,
    required this.name,
    required this.iconAddress,
    required this.value,
  });
}

// dummy reports
List<Report> reports = [
  Report(
    id: "1",
    name: "Products",
    iconAddress: AssetManager.product,
    value: "34,500",
  ),
  Report(
    id: "2",
    name: "Orders",
    iconAddress: AssetManager.order,
    value: "23,900",
  ),
  Report(
    id: "3",
    name: "Customers",
    iconAddress: AssetManager.customers,
    value: "12,345",
  ),
  Report(
    id: "4",
    name: "Sales",
    iconAddress: AssetManager.sales,
    value: "58,98,789",
  ),
];
