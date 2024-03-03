import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1,
      //   childAspectRatio: 6,
      // ),
      itemBuilder: (BuildContext content, int index) {
        Contact contact = allContacts[index];
        return ContactListTile(contact);
      },
      itemCount: allContacts.length,
    );
  }
}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact, {super.key})
      : super(
          title: Text(contact.name),
          subtitle: Text(contact.email),
          leading: CircleAvatar(child: Text(contact.name[0])),
        );
}

class Contact {
  final String name;
  final String email;

  const Contact({
    required this.name,
    required this.email,
  });
}

const allContacts = [
  Contact(name: 'John Doe', email: 'john.doe@example.com'),
  Contact(name: 'Jane Smith', email: 'jane.smith@fakeemail.com'),
  Contact(name: 'Emily Jones', email: 'emily.jones@email.com'),
  Contact(name: 'Michael Brown', email: 'michael.brown@website.com'),
  Contact(name: 'Jessica Taylor', email: 'jessica.taylor@inbox.com'),
  Contact(name: 'William Davis', email: 'william.davis@service.com'),
  Contact(name: 'Sophia Wilson', email: 'sophia.wilson@contact.org'),
  Contact(name: 'James Miller', email: 'james.miller@me.com'),
  Contact(name: 'Olivia Martinez', email: 'olivia.martinez@domain.com'),
  Contact(name: 'Benjamin Anderson', email: 'benjamin.anderson@net.com'),
  Contact(name: 'Lucas Thompson', email: 'lucas.thompson@randommail.com'),
  Contact(name: 'Mia Johnson', email: 'mia.johnson@somemail.com'),
  Contact(name: 'Alexander Robinson', email: 'alex.robinson@website.com'),
  Contact(name: 'Amelia Lee', email: 'amelia.lee@contact.org'),
  Contact(name: 'Ethan White', email: 'ethan.white@me.com'),
  Contact(name: 'Madison Harris', email: 'madison.harris@domain.com'),
  Contact(name: 'Oliver Clark', email: 'oliver.clark@net.com'),
  Contact(name: 'Ava Lewis', email: 'ava.lewis@randommail.com'),
  Contact(name: 'Isabella Walker', email: 'isabella.walker@somemail.com'),
  Contact(name: 'Samuel Allen', email: 'samuel.allen@website.com')
];


