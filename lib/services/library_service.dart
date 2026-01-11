import 'dart:async';
import '../models/book.dart';

class LibraryService {
  static final LibraryService _instance = LibraryService._internal();
  factory LibraryService() => _instance;
  LibraryService._internal();

  final _booksController = StreamController<List<Book>>.broadcast();
  Stream<List<Book>> get booksStream => _booksController.stream;

  final List<Book> _books = [
    Book(
      id: '1',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      category: 'Classic',
      description: 'A story of ambition and love in the 1920s.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: In my younger and more vulnerable years my father gave me some advice that I\'ve been turning over in my mind ever since.',
        'Page 2: "Whenever you feel like criticizing any one," he told me, "just remember that all the people in this world haven\'t had the advantages that you\'ve had."',
        'Page 3: He didn\'t say any more, but we\'ve always been unusually communicative in a reserved way, and I understood that he meant a great deal more than that.',
        'Page 4: In consequence, I\'m inclined to reserve all judgments, a habit that has opened up many curious natures to me and also made me the victim of not a few veteran bores.',
      ],
    ),
    Book(
      id: '2',
      title: '1984',
      author: 'George Orwell',
      category: 'Sci-Fi',
      description: 'A dystopian novel about total surveillance.',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: It was a bright cold day in April, and the clocks were striking thirteen.',
        'Page 2: Winston Smith, his chin nuzzled into his breast in an effort to escape the vile wind, slipped quickly through the glass doors of Victory Mansions.',
        'Page 3: The hallway smelt of boiled cabbage and old rag mats. At one end of it a coloured poster, too large for indoor display, had been tacked to the wall.',
        'Page 4: It depicted simply an enormous face, more than a metre wide: the face of a man of about forty-five, with a heavy black moustache and ruggedly handsome features.',
        'Page 5: BIG BROTHER IS WATCHING YOU, the caption said, while the dark eyes looked deep into Winston\'s own.',
      ],
    ),
    Book(
      id: '3',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      category: 'Classic',
      description: 'A story of racial injustice in the American South.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow.',
        'Page 2: When it healed, and Jem\'s fears of never being able to play football were assuaged, he was seldom self-conscious about his injury.',
        'Page 3: His left arm was somewhat shorter than his right; when he stood or walked, the back of his hand was at right angles to his body.',
        'Page 4: We were far too old to settle an argument with a fist-fight, so we consulted Atticus. Our father said we were both right.',
      ],
    ),
    Book(
      id: '4',
      title: 'The Hobbit',
      author: 'J.R.R. Tolkien',
      category: 'Fantasy',
      description: 'The journey of Bilbo Baggins.',
      imageUrl: 'https://images.unsplash.com/photo-1621351123083-b882da70df64?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell.',
        'Page 2: It was a hobbit-hole, and that means comfort.',
        'Page 3: It had a perfectly round door like a porthole, painted green, with a shiny yellow brass knob in the exact middle.',
        'Page 4: The door opened on to a tube-shaped hall like a tunnel: a very comfortable tunnel without smoke, with panelled walls, and floors tiled and carpeted.',
        'Page 5: The hobbit was a very well-to-do hobbit, and his name was Baggins.',
      ],
    ),
    Book(
      id: '5',
      title: 'Brave New World',
      author: 'Aldous Huxley',
      category: 'Sci-Fi',
      description: 'A vision of a futuristic society.',
      imageUrl: 'https://images.unsplash.com/photo-1589998059171-988d887df646?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: A squat grey building of only thirty-four stories. Over the main entrance the words, CENTRAL LONDON HATCHERY AND CONDITIONING CENTRE.',
        'Page 2: The enormous room on the ground floor faced towards the north. Cold for all the summer beyond the panes.',
        'Page 3: Wintriness responded to wintriness. The overalls of the workers were white, their hands gloved with a pale gum colour.',
        'Page 4: The light was frozen, dead, a ghost. Only from the yellow barrels of the microscopes did it borrow a certain rich and living substance.',
      ],
    ),
    Book(
      id: '6',
      title: 'Dune',
      author: 'Frank Herbert',
      category: 'Sci-Fi',
      description: 'Epic science fiction set on a desert planet.',
      imageUrl: 'https://images.unsplash.com/photo-1531050171669-01449419351d?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: A beginning is the time for taking the most delicate care that the balances are correct.',
        'Page 2: This every sister of the Bene Gesserit knows. To begin your study of the life of Muad\'Dib, then, take care that you first place him in his time.',
        'Page 3: Born in the 57th year of the Padishah Emperor, Shaddam IV. And place him more particularly in his place: the planet Arrakis.',
        'Page 4: Do not be deceived by the fact that he was born on Caladan and lived his first fifteen years there. Arrakis is his true home.',
        'Page 5: He is the Kwisatz Haderach, the one who can be in many places at once.',
      ],
    ),
    Book(
      id: '7',
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      category: 'Classic',
      description: 'A romantic novel of manners.',
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.',
        'Page 2: However little known the feelings or views of such a man may be on his first entering a neighbourhood.',
        'Page 3: This truth is so well fixed in the minds of the surrounding families, that he is considered the rightful property of some one or other of their daughters.',
        'Page 4: "My dear Mr. Bennet," said his lady to him one day, "have you heard that Netherfield Park is let at last?"',
      ],
    ),
    Book(
      id: '8',
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      category: 'Philosophy',
      description: 'A journey of self-discovery.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: The boy\'s name was Santiago . It was almost dark when he arrived with his herd at an abandoned church.',
        'Page 2: The roof had fallen in long ago, and an enormous sycamore had grown on the spot where the sacristy had once stood.',
        'Page 3: He decided to spend the night there. He saw to it that all the sheep entered through the ruined gate.',
        'Page 4: He swept the floor with his jacket and lay down, using the book he had just finished reading as a pillow.',
        'Page 5: He told himself that he would have to start reading thicker books: they lasted longer and made more comfortable pillows.',
      ],
    ),
    Book(
      id: '9',
      title: 'Atomic Habits',
      author: 'James Clear',
      category: 'Self-Help',
      description: 'Building good habits and breaking bad ones.',
      imageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: The fate of British Cycling changed one day in 2003. The organization had recently hired Dave Brailsford as its new performance director.',
        'Page 2: At the time, professional cyclists in Great Britain had endured nearly one hundred years of mediocrity.',
        'Page 3: Since 1908, British riders had won only a single gold medal at the Olympic Games.',
        'Page 4: Brailsford had been hired to put British Cycling on a new trajectory. What made him different was his relentless commitment to a strategy that he referred to as "the aggregation of marginal gains."',
      ],
    ),
    Book(
      id: '10',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      category: 'History',
      description: 'A brief history of humankind.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: About 13.5 billion years ago, matter, energy, time and space came into being in what is known as the Big Bang.',
        'Page 2: The story of these fundamental features of our universe is called physics.',
        'Page 3: About 300,000 years after their appearance, matter and energy started to coalesce into complex structures, called atoms.',
        'Page 4: The story of atoms, molecules and their interactions is called chemistry.',
        'Page 5: About 3.8 billion years ago, on a planet called Earth, certain molecules combined to form particularly large and intricate structures called organisms. The story of organisms is called biology.',
      ],
    ),
    Book(
      id: '11',
      title: 'The Lord of the Rings',
      author: 'J.R.R. Tolkien',
      category: 'Fantasy',
      description: 'An epic high-fantasy novel.',
      imageUrl: 'https://images.unsplash.com/photo-1618336753974-aae8e04506aa?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: When Mr. Bilbo Baggins of Bag End announced that he would shortly be celebrating his eleventy-first birthday with a party of special magnificence.',
        'Page 2: There was much talk and excitement in Hobbiton. Bilbo was very rich and very peculiar, and had been the wonder of the Shire for sixty years.',
        'Page 3: Since his memorable disappearance and unexpected return.',
        'Page 4: The riches he had brought back from his travels had now become a local legend, and it was popularly believed, whatever the old folk might say, that the Hill at Bag End was full of tunnels stuffed with treasure.',
      ],
    ),
    Book(
      id: '12',
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      category: 'Fantasy',
      description: 'The boy who lived.',
      imageUrl: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: Mr. and Mrs. Dursley, of number four, Privet Drive, were proud to say that they were perfectly normal, thank you very much.',
        'Page 2: They were the last people you\'d expect to be involved in anything strange or mysterious, because they just didn\'t hold with such nonsense.',
        'Page 3: Mr. Dursley was the director of a firm called Grunnings, which made drills.',
        'Page 4: He was a big, beefy man with hardly any neck, although he did have a very large moustache.',
        'Page 5: Mrs. Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of her time spying on the neighbours.',
      ],
    ),
    Book(
      id: '13',
      title: 'The Catcher in the Rye',
      author: 'J.D. Salinger',
      category: 'Classic',
      description: 'A story of teenage rebellion.',
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: If you really want to hear about it, the first thing you\'ll probably want to know is where I was born, and what my lousy childhood was like.',
        'Page 2: And how my parents were occupied and all before they had me, and all that David Copperfield kind of crap.',
        'Page 3: But I don\'t feel like going into it, if you want to know the truth.',
        'Page 4: In the first place, that stuff bores me, and in the second place, my parents would have about two hemorrhages apiece if I told anything pretty personal about them.',
      ],
    ),
    Book(
      id: '14',
      title: 'Foundation',
      author: 'Isaac Asimov',
      category: 'Sci-Fi',
      description: 'A galactic empire in decline.',
      imageUrl: 'https://images.unsplash.com/photo-1531050171669-01449419351d?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: Hari Seldon—born in the 11,988th year of the Galactic Era; died 12,069.',
        'Page 2: The dates are more commonly given in terms of the current Foundational Era as -79 to 1 F.E.',
        'Page 3: He was born of middle-class parents on Helicon, Arcturus sector (where his father, a legend has it, was a grower of tobacco).',
        'Page 4: He was a man of great intellectual ability, but even he could not have foreseen the full extent of the collapse of the Empire.',
      ],
    ),
    Book(
      id: '15',
      title: 'Meditations',
      author: 'Marcus Aurelius',
      category: 'Philosophy',
      description: 'Personal reflections of a Roman Emperor.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: From my grandfather Verus I learned good morals and the government of my temper.',
        'Page 2: From the reputation and memory of my father, modesty and a manly character.',
        'Page 3: From my mother, piety and beneficence, and abstinence, not only from evil deeds, but even from evil thoughts.',
        'Page 4: From my great-grandfather, not to have frequented public schools, and to have had good teachers at home, and to know that on such things a man should spend liberally.',
        'Page 5: From my governor, to be neither of the green nor of the blue party at the games in the Circus, nor a partisan either of the Parmularius or the Scutarius at the gladiators\' fights.',
      ],
    ),
    Book(
      id: '16',
      title: 'Psychology of Money',
      author: 'Morgan Housel',
      category: 'Self-Help',
      description: 'Timeless lessons on wealth and greed.',
      imageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: My time as a valet was in the mid-2000s in Los Angeles. At the time, the economy was booming.',
        'Page 2: There was a tech executive who came to the hotel often. He was a genius. He had designed and patented a key component in Wi-Fi routers.',
        'Page 3: But his relationship with money was... different. He used to carry a stack of hundred-dollar bills several inches thick.',
        'Page 4: One day he gave my friend a few thousand dollars in cash and told him to go across the street and buy a few gold coins.',
      ],
    ),
    Book(
      id: '17',
      title: 'Guns, Germs, and Steel',
      author: 'Jared Diamond',
      category: 'History',
      description: 'The fates of human societies.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: We all know that history has proceeded very differently for peoples from different parts of the globe.',
        'Page 2: In the 13,000 years since the end of the last Ice Age, some parts of the world developed literate industrial societies with metal tools.',
        'Page 3: Others developed only nonliterate farming societies, and still others retained societies of hunter-gatherers with stone tools.',
        'Page 4: Those historical inequalities have cast long shadows on the modern world, because the literate societies with metal tools have conquered or exterminated the other societies.',
      ],
    ),
    Book(
      id: '18',
      title: 'Moby Dick',
      author: 'Herman Melville',
      category: 'Classic',
      description: 'The quest for the white whale.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: Call me Ishmael. Some years ago—never mind how long precisely—having little or no money in my purse.',
        'Page 2: And nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world.',
        'Page 3: It is a way I have of driving off the spleen and regulating the circulation.',
        'Page 4: Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul.',
        'Page 5: Whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet.',
      ],
    ),
    Book(
      id: '19',
      title: 'Frankenstein',
      author: 'Mary Shelley',
      category: 'Classic',
      description: 'A scientist creates a sentient creature.',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: You will rejoice to hear that no disaster has accompanied the commencement of an enterprise which you have regarded with such evil forebodings.',
        'Page 2: I arrived here yesterday, and my first task is to assure my dear sister of my welfare and increasing confidence in the success of my undertaking.',
        'Page 3: I am already far north of London, and as I walk in the streets of Petersburgh, I feel a cold northern breeze play upon my cheeks.',
        'Page 4: This breeze, which has travelled from the regions towards which I am advancing, gives me a foretaste of those icy climes.',
      ],
    ),
    Book(
      id: '20',
      title: 'The Martian',
      author: 'Andy Weir',
      category: 'Sci-Fi',
      description: 'Stranded on Mars.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
      content: [
        'Page 1: I’m pretty much fucked. That’s my considered opinion. Fucked.',
        'Page 2: Six days into what should have been the greatest two months of my life, and it’s turned into a nightmare.',
        'Page 3: I don’t even know who’ll be reading this. I guess someone will find it eventually. Maybe a hundred years from now.',
        'Page 4: Log Entry: SOL 6. I’m writing this on the computer in the Hab. It’s the only thing that’s still working.',
        'Page 5: If you’re reading this, it means I didn’t make it. But maybe this log will help someone else.',
      ],
    ),
  ];

  void _notifyListeners() {
    _booksController.add(List.from(_books));
  }

  Future<List<Book>> searchBooks(String query) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (query.isEmpty) return List.unmodifiable(_books);
    return _books
        .where((book) =>
            book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<bool> borrowBook(String bookId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1 && _books[index].isAvailable) {
      _books[index].isAvailable = false;
      _books[index].borrowDate = DateTime.now();
      _books[index].dueDate = DateTime.now().add(const Duration(days: 14));
      _notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> returnBook(String bookId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1 && !_books[index].isAvailable) {
      _books[index].isAvailable = true;
      _books[index].borrowDate = null;
      _books[index].dueDate = null;
      _notifyListeners();
      return true;
    }
    return false;
  }

  void dispose() {
    _booksController.close();
  }
}
