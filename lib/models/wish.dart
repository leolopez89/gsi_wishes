class Wish {
  String title;
  String description;
  String type;
  String project;
  String date;
  String assigned;
  String author;
  String state;

  Wish({
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
