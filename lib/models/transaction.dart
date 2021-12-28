class Transaction {
  final int id;
  final String amount, purpose;
  final DateTime dateAdded;

  // postional args
  // Transaction(this.id, this.amount, this.purpose, this.dateAdded);

  // named args

  // optional/named
  // Transaction({
  //   this.id,
  //   this.amount,
  //   this.purpose,
  //   this.dateAdded,
  // });

  // compulsory/named
  Transaction({
    required this.id,
    required this.amount,
    required this.purpose,
    required this.dateAdded,
  });

  // Transaction(int id, String amount, String purpose, DateTime dateAdded) {
  //   this.id = id;
  //   this.amount = amount;
  //   this.purpose = purpose;
  //   this.dateAdded = dateAdded;
  // }
}
