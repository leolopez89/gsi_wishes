class Wish {
  String id;
  String title;
  String description;
  String type;
  String project;
  String date;
  String assigned;
  String author;
  String state;

  Wish({
    this.id = "",
    this.title = "",
    this.description = "",
    this.type = "",
    this.project = "",
    this.date = "",
    this.assigned = "",
    this.author = "",
    this.state = "",
  });

  @override
  String toString() {
    return {
      "id": this.id,
      "title": this.title,
      "description": this.description,
      "type": this.type,
      "project": this.project,
      "date": this.date,
      "assigned": this.assigned,
      "author": this.author,
      "state": this.state,
    }.toString();
  }
}
