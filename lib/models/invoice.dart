class Invoice {
  Invoice({
    required this.id,
    required this.createdAt,
    required this.paymentDue,
    required this.description,
    required this.paymentTerms,
    required this.clientName,
    required this.clientEmail,
    required this.status,
    required this.senderAddress,
    required this.clientAddress,
    required this.items,
    required this.total,
  });

  late final String id;
  late final String createdAt;
  late final String paymentDue;
  late final String description;
  late final int paymentTerms;
  late final String clientName;
  late final String clientEmail;
  late final String status;
  late final SenderAddress senderAddress;
  late final ClientAddress clientAddress;
  late final List<Items> items;
  late final dynamic total;

  Invoice.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    paymentDue = json['paymentDue'];
    description = json['description'];
    paymentTerms = json['paymentTerms'];
    clientName = json['clientName'];
    clientEmail = json['clientEmail'];
    status = json['status'];
    senderAddress = SenderAddress.fromJson(json['senderAddress']);
    clientAddress = ClientAddress.fromJson(json['clientAddress']);
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    total = json['total'];
  }

  Invoice copyWith({ String? status,String? description}) =>
      Invoice(id: id,
          createdAt: createdAt,
          paymentDue: paymentDue,
          description: description ?? this.description,
          paymentTerms: paymentTerms,
          clientName: clientName,
          clientEmail: clientEmail,
          status: status ?? this.status,
          senderAddress: senderAddress,
          clientAddress: clientAddress,
          items: items,
          total: total);


}

class SenderAddress {
  SenderAddress({
    required this.street,
    required this.city,
    required this.postCode,
    required this.country,
  });

  late final String street;
  late final String city;
  late final String postCode;
  late final String country;

  SenderAddress.fromJson(Map<String, dynamic> json){
    street = json['street'];
    city = json['city'];
    postCode = json['postCode'];
    country = json['country'];
  }
}

class ClientAddress {
  ClientAddress({
    required this.street,
    required this.city,
    required this.postCode,
    required this.country,
  });

  late final String street;
  late final String city;
  late final String postCode;
  late final String country;

  ClientAddress.fromJson(Map<String, dynamic> json){
    street = json['street'];
    city = json['city'];
    postCode = json['postCode'];
    country = json['country'];
  }

}

class Items {
  Items({
    required this.name,
    required this.quantity,
    required this.price,
    required this.total,
  });

  late final String name;
  late final int quantity;
  late final dynamic price;
  late final dynamic total;

  Items.fromJson(Map<String, dynamic> json){
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }
}