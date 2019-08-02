# Todo
TodoList Task


* App structure I use **MVP** with **Delegate** to notify about updates.

* I use the **Repository** design pattern to act as a Data source from Database.

* Separate the data source of UITableView to other class **TodoTableViewDataSource**.

* I use **CellReusable** protocol and create 2 extensions for UITableView to reduce code when reusing the cell.

* Create Extension for UITableViewCell to return Empty Cell with an error message.
* I use [SwiftLint](https://github.com/realm/SwiftLint) to enhance Swift style.

* I use [JSONExport](https://github.com/Ahmed-Ali/JSONExport) to generate model from JSON.

* I use [SnapKit](https://github.com/SnapKit/SnapKit) to create constraints of UI.

* I use [Realm Database](https://github.com/realm/realm-cocoa/tree/master/RealmSwift).



# UnitTest
* I apply  **Arrange, Act and Assert (AAA) Pattern** in Unit Testing.
* Test get data from API and From Local JSON.
* Test **ViewModel** (Get Data from DataBase).
* Test **ViewController** (Get Data from DataBase and compare number of Cell in TableView).
