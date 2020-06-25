import 'package:crib_hunter/Models/messagingObjects.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:crib_hunter/Models/reviewObjects.dart';
import 'package:crib_hunter/Models/userObjects.dart';

class PracticeData {
  // User Data
  static List<User> users = [];
  static List<Posting> postings = [];

  static populateFields() {
    User user1 = User(
      firstName: "Bzar",
      lastName: "Nutz",
      email: "a.garner@bzarnutz.com",
      bio: "I like travelling, exploring new places, and seeing the world",
      city: "Chicago",
      country: "United States",
    );
    user1.isHost = true;

    User user2 = User(
      firstName: "Keen",
      lastName: "James",
      email: "keen_james4000@gmail.com",
      bio: "I am a cool guy who likes to travel and have fun in the sun",
      city: "Everywhere",
      country: "Somewhere",
    );

    users.add(user1);
    users.add(user2);

    Review review = Review();
    review.createReview(
      user2.createUserFromContact(),
      "Fun guy, would definitely recommend him to others",
      4.5,
      DateTime.now(),
    );
    user1.reviews.add(review);

    Conversation conversation = Conversation();
    conversation.createConversation(user2.createContactFromUser(), []);

    Message message1 = Message();
    message1.createMessage(
      user1.createContactFromUser(),
      "Hey how's it going?",
      DateTime.now(),
    );
    Message message2 = Message();
    message2.createMessage(
      user2.createContactFromUser(),
      "Hey it's going well, how have you been?",
      DateTime.now(),
    );
    conversation.messages.add(message1);
    conversation.messages.add(message2);

    user1.conversations.add(conversation);

    Posting posting1 = Posting(
      name: "Cool Crib",
      type: "House",
      price: "120",
      description:
          "Cool crib in the heart of the city, perfect for serenity and a quiet getaway",
      address: "1132 E. 42nd Pl",
      city: "Chicago",
      country: "USA",
      host: user1.createContactFromUser(),
    );
    //  posting1.setImages(['assets/images/apartment.jpg', 'assets/images/apartment.jpg']);
    posting1.amenities = ['Washer', 'Dryer', 'Iron', 'Coffee Maker'];
    posting1.beds = {
      'small': 0,
      'medium': 2,
      'large': 2,
    };
    posting1.bathrooms = {
      'full': 2,
      'half': 1,
    };
    Posting posting2 = Posting(
      name: "Chic Apartment",
      type: "Apartment",
      price: "100",
      description:
          "Modern and chic, central location, convenient and close to everything",
      address: "95 W. State St",
      city: "Oak Park",
      country: "USA",
      host: user2.createContactFromUser(),
    );
//    posting2.setImages(['assets/images/apartment3.jpg', 'assets/images/apartment3.jpg']);
    posting2.amenities = ['Dishwasher', 'Cable', 'WiFi'];
    posting2.beds = {
      'small': 1,
      'medium': 0,
      'large': 1,
    };
    posting2.bathrooms = {
      'full': 1,
      'half': 1,
    };
    postings.add(posting1);
    postings.add(posting2);

    Booking booking1 = Booking();
    booking1.createBooking(
      posting2,
      user1.createContactFromUser(),
      [
        DateTime(2020, 02, 22),
        DateTime(2020, 02, 23),
        DateTime(2020, 02, 24),
      ],
    );
    Booking booking2 = Booking();
    booking2.createBooking(
      posting2,
      user1.createContactFromUser(),
      [
        DateTime(2020, 05, 17),
        DateTime(2020, 05, 18),
      ],
    );
    posting2.bookings.add(booking1);
    posting2.bookings.add(booking2);

    Review postingReview = Review();
    postingReview.createReview(
      user2.createContactFromUser(),
      "Pretty decent place, not as big as I was expecting though",
      3.5,
      DateTime(2020, 08, 13),
    );
    posting1.reviews.add(postingReview);

    user1.bookings.add(booking1);
    user1.bookings.add(booking2);
    user1.myPostings.add(posting1);
    user2.myPostings.add(posting2);

    user1.savedPostings.add(posting2);
  }
}
