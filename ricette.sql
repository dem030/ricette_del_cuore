-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Creato il: Feb 10, 2025 alle 11:36
-- Versione del server: 8.0.41
-- Versione PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ricette`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ricette`
--

CREATE TABLE `ricette` (
  `id` int NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `ingredienti` text NOT NULL,
  `ricetta` text NOT NULL,
  `tempo_preparazione` int DEFAULT NULL,
  `difficolta` enum('Facile','Medio','Difficile') DEFAULT 'Facile',
  `cucina` varchar(50) DEFAULT 'Italiana'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `ricette`
--

INSERT INTO `ricette` (`id`, `titolo`, `ingredienti`, `ricetta`, `tempo_preparazione`, `difficolta`, `cucina`) VALUES
(54, 'Lasagna alla Bolognese', 'lasagna sheets, ground beef, tomato sauce, béchamel, parmesan, onions, garlic, carrots, celery, olive oil, basil', 'Prepara un ragù di carne con soffritto di verdure, alterna strati di pasta, besciamella e sugo, e cuoci in forno fino a doratura.', 120, 'Medio', 'Italiana'),
(55, 'Pizza Margherita', 'pizza dough, tomato sauce, mozzarella, basil, olive oil, salt', 'Stendi l\'impasto, distribuisci il sugo, aggiungi mozzarella e basilico, un filo d\'olio e cuoci in forno molto caldo fino a che la crosta risulti croccante.', 30, 'Facile', 'Italiana'),
(56, 'Risotto alla Milanese', 'arborio rice, saffron, chicken broth, white wine, butter, parmesan, onions', 'Soffriggi le cipolle nel burro, tosta il riso, sfuma con vino bianco, aggiungi brodo e zafferano gradualmente, e manteca con parmigiano.', 45, 'Medio', 'Italiana'),
(57, 'Pasta al Pesto', 'pasta, basil, pine nuts, garlic, olive oil, parmesan, salt', 'Frulla basilico, pinoli, aglio, olio e parmigiano per ottenere il pesto, condisci la pasta appena scolata e servi.', 25, 'Facile', 'Italiana'),
(58, 'Gnocchi al Pomodoro', 'gnocchi, salsa di pomodoro, aglio, basilico, olio d\\\'oliva e parmigiano', 'Cuoci gli gnocchi finché salgono in superficie, saltali con un sugo di pomodoro, aglio e basilico e completa con parmigiano.', 30, 'Facile', 'Italiana'),
(59, 'Ossobuco alla Milanese', 'veal shanks, white wine, broth, tomatoes, onions, carrots, celery, garlic, gremolata', 'Rosola gli ossibuchi, sfuma con vino e aggiungi verdure e brodo; cuoci lentamente fino a renderli teneri e servi con gremolata.', 150, 'Difficile', 'Italiana'),
(60, 'Minestrone', 'mixed vegetables, beans, pasta, tomatoes, vegetable broth, olive oil, herbs', 'Soffriggi le verdure, aggiungi brodo, pomodori e fagioli, e unisci la pasta negli ultimi minuti di cottura.', 60, 'Medio', 'Italiana'),
(61, 'Saltimbocca alla Romana', 'veal, prosciutto, sage, white wine, butter, olive oil, salt, pepper', 'Adagia una foglia di prosciutto e una di salvia su fettine di vitello, cuoci in padella con burro e olio, sfuma con vino bianco.', 35, 'Medio', 'Italiana'),
(62, 'Ravioli di Ricotta e Spinaci', 'ravioli pasta, ricotta, spinach, nutmeg, parmesan, egg, salt, pepper', 'Prepara un ripieno di ricotta e spinaci con un pizzico di noce moscata, farcisci la pasta fresca, cuoci in acqua bollente e servi con burro e salvia.', 40, 'Medio', 'Italiana'),
(63, 'Fettuccine Alfredo', 'fettuccine, butter, heavy cream, parmesan, garlic, salt, pepper', 'Cuoci la pasta e condiscila con una salsa cremosa di burro, panna e parmigiano, insaporendo con un po’ di aglio.', 25, 'Facile', 'Italiana'),
(64, 'Insalata Caprese', 'tomatoes, mozzarella, basil, olive oil, salt, pepper', 'Disponi fette di pomodoro e mozzarella alternate con foglie di basilico, condisci con olio, sale e pepe.', 10, 'Facile', 'Italiana'),
(65, 'Polenta con Funghi', 'polenta, mixed mushrooms, garlic, parsley, butter, parmesan, olive oil', 'Cuoci la polenta, prepara un soffritto di funghi e aglio, completa con prezzemolo e parmigiano, e servi insieme.', 40, 'Medio', 'Italiana'),
(66, 'Arancini di Riso', 'risotto, mozzarella, peas, ham, breadcrumbs, eggs, flour, tomato sauce', 'Forma delle palline di risotto farcite con mozzarella, infarinale, passale in uovo e pangrattato, poi friggile fino a doratura.', 60, 'Difficile', 'Italiana'),
(67, 'Tortilla Española', 'eggs, potatoes, onions, olive oil, salt', 'Fai rosolare sottili fette di patate e cipolle, mescola con uova sbattute e cuoci lentamente in padella fino a ottenere una frittata compatta.', 35, 'Facile', 'Spagnola'),
(68, 'Gazpacho Andaluz', 'tomatoes, cucumbers, bell peppers, onions, garlic, olive oil, vinegar, bread, salt', 'Frulla le verdure con pane ammollato, olio e aceto, raffredda e servi come zuppa fredda estiva.', 20, 'Facile', 'Spagnola'),
(69, 'Croquetas de Jamón', 'ham, béchamel, flour, milk, eggs, breadcrumbs, oil, nutmeg', 'Prepara una besciamella con dadini di prosciutto, forma delle crocchette, passale in panatura e friggi fino a doratura.', 45, 'Medio', 'Spagnola'),
(70, 'Empanadas Gallegas', 'flour, pork, onions, bell peppers, tomatoes, paprika, olive oil, eggs', 'Prepara un impasto, farciscilo con un ragù di maiale e verdure aromatizzato alla paprika, richiudi e cuoci al forno o friggi.', 50, 'Medio', 'Spagnola'),
(71, 'Pulpo a la Gallega', 'octopus, potatoes, paprika, olive oil, salt', 'Cuoci il polpo fino a renderlo tenero, taglialo a fette e servi su fette di patate bollite, condendo con paprika e olio.', 70, 'Difficile', 'Spagnola'),
(72, 'Fabada Asturiana', 'fabes beans, chorizo, morcilla, bacon, saffron, paprika, garlic, onions, olive oil', 'Lascia in ammollo le fave, cuoci a fuoco lento con i salumi e le spezie fino a ottenere un ragù cremoso e saporito.', 120, 'Difficile', 'Spagnola'),
(73, 'Churros con Chocolate', 'flour, water, salt, sugar, oil, chocolate, milk', 'Prepara una pastella liscia, estrudila in olio bollente a forma di bastoncini e servi con una densa cioccolata calda.', 30, 'Medio', 'Spagnola'),
(74, 'Patatas Bravas', 'potatoes, tomato sauce, garlic, paprika, olive oil, salt, pepper', 'Friggi cubetti di patate fino a renderli croccanti e condiscili con una salsa piccante a base di pomodoro e paprika.', 30, 'Facile', 'Spagnola'),
(75, 'Pisto Manchego', 'tomatoes, zucchini, eggplant, bell peppers, onions, garlic, olive oil, eggs', 'Cuoci lentamente le verdure a cubetti in olio fino a ottenere uno stufato, e completa con un uovo fritto sopra.', 40, 'Medio', 'Spagnola'),
(76, 'Coq au Vin', 'chicken, red wine, mushrooms, onions, bacon, garlic, thyme, bay leaves, carrots', 'Marina il pollo nel vino, poi cuocilo lentamente con bacon, funghi e verdure fino a che diventa tenero.', 150, 'Difficile', 'Francese'),
(77, 'Ratatouille', 'eggplant, zucchini, bell peppers, tomatoes, onions, garlic, olive oil, herbs', 'Disponi le verdure a fette o a cubetti in una teglia, condisci con olio ed erbe e cuoci in forno lentamente.', 90, 'Medio', 'Francese'),
(78, 'Quiche Lorraine', 'pie crust, eggs, cream, bacon, cheese, nutmeg, salt, pepper', 'Prepara un ripieno a base di uova, panna e bacon, versa in una base di pasta brisée e cuoci in forno fino a solidificazione.', 45, 'Medio', 'Francese'),
(79, 'Bouillabaisse', 'various fish, shellfish, tomatoes, fennel, saffron, garlic, onions, olive oil, herbs', 'Cuoci a fuoco lento pesce e crostacei con pomodoro, finocchio e zafferano per ottenere un brodo saporito, servendo con rouille.', 120, 'Difficile', 'Francese'),
(80, 'Beef Bourguignon', 'beef, red wine, mushrooms, onions, carrots, bacon, garlic, thyme, bay leaves', 'Marina la carne nel vino, poi brasala lentamente con verdure e bacon fino a renderla estremamente tenera.', 180, 'Difficile', 'Francese'),
(81, 'Soupe à l\'oignon', 'onions, beef broth, butter, baguette, gruyère, thyme, bay leaf, salt, pepper', 'Caramellizza le cipolle nel burro, aggiungi il brodo e le erbe, e servi con fette di baguette gratinate al formaggio.', 60, 'Medio', 'Francese'),
(82, 'Salade Niçoise', 'tuna, potatoes, green beans, tomatoes, olives, eggs, anchovies, olive oil, vinegar', 'Disponi patate bollite, fagiolini, pomodori, uova e tonno su un piatto e condisci con olio e aceto.', 25, 'Facile', 'Francese'),
(83, 'Escargots de Bourgogne', 'snails, garlic, parsley, butter, white wine, salt, pepper', 'Riempi le conchiglie di lumache con una miscela di burro, aglio e prezzemolo e cuoci in forno fino a che il burro bolle.', 35, 'Medio', 'Francese'),
(84, 'Tarte Tatin', 'apples, puff pastry, butter, sugar, lemon juice', 'Caramellizza le mele in burro e zucchero, copri con pasta sfoglia e cuoci, poi capovolgi prima di servire.', 50, 'Medio', 'Francese'),
(85, 'Duck Confit', 'duck legs, salt, garlic, thyme, duck fat', 'Condisci le cosce d\'anatra con sale e erbe, cuoci lentamente nel proprio grasso fino a renderle morbide, poi rosola la pelle prima di servire.', 180, 'Difficile', 'Francese'),
(86, 'Cassoulet', 'white beans, duck, pork sausages, bacon, tomatoes, garlic, herbs, breadcrumbs', 'Disponi fagioli e carni in una casseruola, copri con spezie e cuoci a fuoco basso per ore, completando con una crosta di pangrattato.', 240, 'Difficile', 'Francese'),
(87, 'Salade Lyonnaise', 'frisée lettuce, bacon, poached eggs, croutons, Dijon mustard, vinegar', 'Mescola lattuga croccante con bacon, crostini e un uovo in camicia, condisci con una vinaigrette al senape.', 20, 'Facile', 'Francese'),
(88, 'Clafoutis aux Cerises', 'cherries, eggs, milk, flour, sugar, vanilla, butter, salt', 'Disponi le ciliegie in una teglia, versa sopra una pastella dolce e cuoci fino a che risulti leggermente dorato.', 45, 'Medio', 'Francese'),
(89, 'Mille-Feuille', 'puff pastry, pastry cream, powdered sugar', 'Interseca strati di sfoglia cotta con crema pasticcera e spolvera con zucchero a velo.', 90, 'Difficile', 'Francese'),
(90, 'Ramen Shoyu', 'ramen noodles, soy sauce, chicken broth, pork, scallions, nori, eggs, bamboo shoots', 'Prepara un brodo a base di salsa di soia, cuoci noodles e condimenti separatamente, quindi unisci il tutto in una ciotola fumante.', 60, 'Medio', 'Giapponese'),
(91, 'Tempura', 'shrimp, vegetables, tempura batter, flour, eggs, cold water, oil, salt', 'Immergi gamberi e verdure in una pastella leggera e friggi rapidamente fino a ottenere una croccantezza perfetta.', 30, 'Medio', 'Giapponese'),
(92, 'Tonkatsu', 'pork cutlets, flour, eggs, panko breadcrumbs, oil, cabbage, tonkatsu sauce', 'Passa le fettine di maiale in farina, uovo e panko, friggile fino a doratura e servi con salsa tonkatsu e insalata di cavolo.', 40, 'Facile', 'Giapponese'),
(93, 'Yakitori', 'chicken, scallions, soy sauce, mirin, sugar, sake, skewers', 'Marina il pollo con una salsa dolce-salata, infilza con cipollotti e griglia, spennellando con la marinata.', 30, 'Facile', 'Giapponese'),
(94, 'Okonomiyaki', 'cabbage, flour, eggs, pork belly, scallions, bonito flakes, mayonnaise, okonomiyaki sauce', 'Mescola cavolo, uova e farina, aggiungi fettine di pancetta, cuoci sulla piastra e decora con salsa, maionese e scaglie di pesce.', 35, 'Medio', 'Giapponese'),
(95, 'Sashimi', 'fresh fish, soy sauce, wasabi, ginger', 'Affetta sottilmente il pesce freschissimo e servi freddo con salsa di soia, wasabi e zenzero sottaceto.', 15, 'Facile', 'Giapponese'),
(96, 'Udon Noodles', 'udon noodles, dashi broth, soy sauce, mirin, scallions, tempura bits', 'Cuoci gli udon e servili in brodo dashi caldo, completando con scalogni e pezzi di tempura croccante.', 25, 'Facile', 'Giapponese'),
(97, 'Miso Soup', 'dashi, miso paste, tofu, wakame, scallions', 'Sciogli la pasta di miso nel brodo di dashi, aggiungi tofu e alghe, riscalda senza far bollire.', 15, 'Facile', 'Giapponese'),
(98, 'Chirashi Sushi', 'sushi rice, assorted sashimi, vegetables, nori, sesame seeds, vinegar', 'Disponi il riso per sushi in una ciotola e guarniscilo con sashimi assortito, verdure e semi di sesamo.', 40, 'Medio', 'Giapponese'),
(99, 'Takoyaki', 'octopus, takoyaki batter, tempura scraps, green onions, pickled ginger, takoyaki sauce, mayo, bonito flakes', 'Cuoci il composto in una speciale piastra per takoyaki, gira le sfere fino a renderle dorate e condisci con salsa e maionese.', 30, 'Medio', 'Giapponese'),
(100, 'Sukiyaki', 'thinly sliced beef, tofu, mushrooms, noodles, vegetables, soy sauce, sugar, mirin, dashi', 'Cuoci carne e verdure in una pentola con un brodo dolce a base di soia, servendo con una leggera immersione in uovo crudo.', 40, 'Difficile', 'Giapponese'),
(101, 'Onigiri', 'rice, salt, nori, fillings (tuna mayo, umeboshi, etc.)', 'Forma il riso condito in triangoli, inserisci il ripieno e avvolgi con una striscia di alga nori.', 20, 'Facile', 'Giapponese'),
(102, 'Kare Raisu', 'rice, Japanese curry roux, vegetables, meat (chicken or beef), potatoes, carrots, onions', 'Cuoci carne e verdure, aggiungi il roux di curry e lascia sobbollire fino a ottenere una salsa densa, poi servi sopra riso al vapore.', 50, 'Facile', 'Giapponese'),
(103, 'Matcha Green Tea Cake', 'matcha powder, flour, eggs, sugar, butter, baking powder, milk', 'Mescola gli ingredienti secchi con quelli umidi e matcha, cuoci in forno fino a ottenere un dolce soffice e aromatico.', 45, 'Medio', 'Giapponese'),
(104, 'Butter Chicken', 'chicken, tomato puree, cream, butter, garlic, ginger, spices, fenugreek', 'Marina il pollo nelle spezie, cuoci in un ricco sugo di pomodoro e panna con abbondante burro, finendo con foglie di fieno greco.', 60, 'Medio', 'Indiana'),
(105, 'Chicken Tikka Masala', 'chicken, yogurt, tomato sauce, garlic, ginger, garam masala, cream, spices', 'Marina il pollo nello yogurt speziato, griglialo e poi cuocilo in una cremosa salsa di pomodoro e spezie.', 55, 'Medio', 'Indiana'),
(106, 'Palak Paneer', 'spinach, paneer, onions, garlic, ginger, tomatoes, spices, cream', 'Cuoci gli spinaci e frullali, saltali con cubetti di paneer e spezie, e termina con un filo di panna.', 40, 'Facile', 'Indiana'),
(107, 'Biryani', 'basmati rice, chicken or mutton, yogurt, spices, saffron, onions, garlic, ginger, herbs', 'Stratifica carne marinata e riso parboiled, cuoci a fuoco basso con spezie e zafferano fino a ottenere un piatto profumato.', 90, 'Difficile', 'Indiana'),
(108, 'Samosa', 'flour, potatoes, peas, spices, onions, garlic, ginger, oil', 'Prepara un ripieno di patate e piselli ben speziato, avvolgilo in sfoglia sottile e friggi fino a renderlo croccante.', 30, 'Medio', 'Indiana'),
(109, 'Dal Makhani', 'whole black lentils, kidney beans, butter, cream, tomatoes, garlic, ginger, spices', 'Cuoci lentamente lenticchie e fagioli in un ricco sugo di pomodoro, burro e panna per diverse ore.', 120, 'Difficile', 'Indiana'),
(110, 'Rogan Josh', 'lamb, yogurt, garlic, ginger, onions, tomatoes, spices, ghee', 'Braise a fuoco lento agnello marinato in yogurt e spezie fino a renderlo tenero e aromatico.', 90, 'Difficile', 'Indiana'),
(111, 'Aloo Gobi', 'potatoes, cauliflower, tomatoes, onions, garlic, ginger, spices, cilantro', 'Saltella patate e cavolfiore con pomodori e spezie fino a ottenere un contorno morbido e ben condito.', 35, 'Facile', 'Indiana'),
(112, 'Chole Bhature', 'chickpeas, tomatoes, onions, garlic, ginger, spices, flour, yogurt, oil', 'Prepara un curry speziato di ceci e servi con soffici focacce fritte, tipiche della tradizione.', 50, 'Difficile', 'Indiana'),
(113, 'Tandoori Chicken', 'chicken, yogurt, lemon juice, garlic, ginger, tandoori spices, oil', 'Marina il pollo in yogurt e spezie tandoori, poi cuoci in forno o tandoor fino a ottenere una cottura affumicata.', 45, 'Medio', 'Indiana'),
(114, 'Naan Bread', 'flour, yeast, yogurt, milk, sugar, salt, oil', 'Impasta gli ingredienti, lascia lievitare, stendi in forme rotonde e cuoci in forno molto caldo o in tandoor.', 60, 'Medio', 'Indiana'),
(115, 'Pani Puri', 'semolina, flour, potatoes, chickpeas, tamarind, mint, spices, water', 'Prepara piccole sfoglie croccanti, farciscile con un ripieno di patate e ceci e servi con acqua aromatizzata al tamarindo.', 30, 'Facile', 'Indiana'),
(116, 'Masala Dosa', 'rice, lentils, potatoes, mustard seeds, curry leaves, turmeric, oil', 'Fermenta una pastella di riso e lenticchie, stendila sottilmente in padella, farcisci con patate speziate e piega.', 40, 'Medio', 'Indiana'),
(117, 'Vindaloo', 'meat (pork or lamb), vinegar, garlic, ginger, spices, potatoes', 'Marina la carne in aceto e spezie piccanti, poi cuoci con patate fino a ottenere un curry molto saporito e piccante.', 70, 'Difficile', 'Indiana'),
(118, 'Roti', 'whole wheat flour, water, salt, oil', 'Impasta gli ingredienti fino a ottenere una consistenza liscia, forma delle palline e stendile sottilmente, poi cuoci sulla piastra calda.', 20, 'Facile', 'Indiana'),
(119, 'Kung Pao Chicken', 'chicken, peanuts, dried chili peppers, garlic, ginger, soy sauce, vinegar, sugar, scallions', 'Saltella il pollo a cubetti con arachidi e peperoncini, condisci con una salsa agrodolce e guarnisci con scalogni.', 30, 'Medio', 'Cinese'),
(120, 'Sweet and Sour Pork', 'pork, bell peppers, pineapple, vinegar, sugar, ketchup, soy sauce, cornstarch', 'Infarina e friggi il maiale, poi saltalo con peperoni, ananas e una salsa agrodolce.', 40, 'Medio', 'Cinese'),
(121, 'Chow Mein', 'noodles, chicken or vegetables, soy sauce, garlic, ginger, vegetables, oil', 'Salta in padella noodles con verdure e/o carne, insaporisci con salsa di soia e servi immediatamente.', 25, 'Facile', 'Cinese'),
(122, 'Peking Duck', 'duck, maltose syrup, five-spice powder, cucumber, scallions, pancakes, hoisin sauce', 'Arrostisci l\'anatra dopo una fase di essiccazione e glassatura, poi servi con pancake, cetriolo, cipollotti e salsa hoisin.', 180, 'Difficile', 'Cinese'),
(123, 'Mapo Tofu', 'tofu, ground pork, fermented bean paste, garlic, ginger, chili oil, Sichuan peppercorns, scallions', 'Cuoci il maiale macinato con spezie, aggiungi il tofu e lascia sobbollire in una salsa piccante e fragrante.', 30, 'Medio', 'Cinese'),
(124, 'Dim Sum', 'assorted dumplings, shrimp, pork, vegetables, wrappers, dipping sauces', 'Prepara vari ripieni, confezionali in sottili involucri e cuoci a vapore, servendo con salse diverse.', 60, 'Difficile', 'Cinese'),
(125, 'Hot and Sour Soup', 'tofu, mushrooms, bamboo shoots, eggs, vinegar, soy sauce, chili, broth, cornstarch', 'Porta a bollore il brodo con verdure, addensa con amido e crea striature di uovo prima di servire.', 25, 'Medio', 'Cinese'),
(126, 'Fried Rice', 'rice, eggs, vegetables, soy sauce, sesame oil, green onions, meat or shrimp', 'Salta il riso avanzato con uova strapazzate, verdure e condimenti, completando con un filo di olio di sesamo.', 20, 'Facile', 'Cinese'),
(127, 'Spring Rolls', 'rice paper, vegetables, glass noodles, mushrooms, oil, dipping sauce', 'Riempi involucri sottili con verdure saltate e noodles, chiudi e friggi fino a renderli croccanti.', 30, 'Medio', 'Cinese'),
(128, 'Wonton Soup', 'wonton wrappers, ground pork, shrimp, ginger, garlic, broth, scallions, soy sauce', 'Riempi i wonton con un misto di carne e gamberi, cuoci in brodo caldo e guarnisci con scalogni.', 35, 'Medio', 'Cinese'),
(129, 'Beef and Broccoli', 'beef, broccoli, garlic, soy sauce, oyster sauce, ginger, cornstarch, oil', 'Salta fettine di manzo e broccoli in padella con una salsa densa ottenuta da soia e ostriche.', 25, 'Facile', 'Cinese'),
(130, 'Szechuan Shrimp', 'shrimp, chili peppers, garlic, ginger, Sichuan peppercorns, soy sauce, vinegar, sugar', 'Salta i gamberi con peperoncini e spezie szechuan per ottenere un piatto piccante e aromatico.', 20, 'Medio', 'Cinese'),
(131, 'Char Siu Pork', 'pork, hoisin sauce, honey, soy sauce, Chinese five-spice, red food coloring, garlic', 'Marina il maiale in una salsa dolce-salata, arrostiscilo lentamente e affetta sottilmente per servire.', 90, 'Medio', 'Cinese'),
(132, 'Egg Drop Soup', 'chicken broth, eggs, cornstarch, ginger, scallions, salt, white pepper', 'Porta il brodo a sobbollire, versa uova sbattute a filo creando striature delicate, regola di sale e pepe.', 15, 'Facile', 'Cinese'),
(133, 'Lion’s Head Meatballs', 'ground pork, water chestnuts, ginger, garlic, green onions, soy sauce, broth, bok choy', 'Forma grandi polpette di maiale, cuoci in brodo con verdure fino a ottenere una consistenza morbida e saporita.', 60, 'Difficile', 'Cinese'),
(134, 'Tacos al Pastor', 'pork, pineapple, achiote, chili, garlic, onions, cilantro, lime, tortillas', 'Marina il maiale in una miscela di spezie e ananas, griglialo e servi in tortilla con cipolla e coriandolo.', 40, 'Medio', 'Messicana'),
(135, 'Enchiladas', 'tortillas, chicken, cheese, enchilada sauce, onions, garlic, spices', 'Riempi le tortillas con pollo e formaggio, ricopri di salsa enchilada e cuoci in forno fino a che il formaggio si fonde.', 45, 'Medio', 'Messicana'),
(136, 'Guacamole', 'avocados, lime, red onion, tomato, cilantro, jalapeño, salt', 'Schiaccia gli avocado, aggiungi verdure tritate finemente e condimenti, mescola e servi freddo.', 10, 'Facile', 'Messicana'),
(137, 'Chiles Rellenos', 'poblano peppers, cheese, eggs, flour, tomato sauce, salt, pepper', 'Arrostisci i poblano, rimuovi la pelle, farcisci con formaggio, passa in pastella e friggi, infine condisci con salsa di pomodoro.', 50, 'Difficile', 'Messicana'),
(138, 'Quesadillas', 'tortillas, cheese, chicken or vegetables, salsa, sour cream', 'Riempi le tortillas con formaggio e ripieno a scelta, scottale in padella fino a che il formaggio si scioglie e servi calde.', 15, 'Facile', 'Messicana'),
(139, 'Pozole', 'pork, hominy, chili peppers, garlic, onions, oregano, lime, radishes', 'Cuoci il maiale con omogeneo granoturco (hominy) e spezie fino a ottenere un brodo ricco, guarnisci con radici e lime.', 120, 'Difficile', 'Messicana'),
(140, 'Mole Poblano', 'chicken, mole sauce (chocolate, chili, spices), sesame seeds, tortillas', 'Cuoci il pollo in un complesso e aromatico mole a base di cioccolato e peperoncino, servendo con riso e semi di sesamo.', 90, 'Difficile', 'Messicana'),
(141, 'Tamales', 'corn dough, pork or chicken, chili sauce, corn husks, spices', 'Farcisci impasto di mais con carne e salsa, avvolgi nelle foglie di mais e cuoci a vapore fino a compattezza.', 120, 'Difficile', 'Messicana'),
(142, 'Ceviche', 'fresh fish, lime juice, red onion, cilantro, chili, salt', 'Marina il pesce tagliato a cubetti nel succo di lime fino a che diventa opaco, mescola con verdure tritate e servi freddo.', 20, 'Facile', 'Messicana'),
(143, 'Fajitas', 'chicken or beef, bell peppers, onions, tortillas, lime, spices, oil', 'Griglia carne e verdure tagliate a strisce, servi calde su tortillas con una spruzzata di lime.', 30, 'Facile', 'Messicana'),
(144, 'Burritos', 'tortillas, rice, beans, meat, cheese, salsa, guacamole', 'Riempi tortillas grandi con riso, fagioli, carne e condimenti, arrotola e taglia a metà per servire.', 25, 'Facile', 'Messicana'),
(145, 'Salsa Fresca', 'tomatoes, onions, cilantro, lime, jalapeño, salt', 'Taglia finemente tutti gli ingredienti, mescola e lascia riposare in frigorifero per un gusto rinfrescante.', 10, 'Facile', 'Messicana'),
(146, 'Camarones a la Diabla', 'shrimp, chili sauce, garlic, lime, butter, salt', 'Salta i gamberi in una salsa piccante a base di aglio, burro e lime, e servi immediatamente.', 20, 'Medio', 'Messicana'),
(147, 'Elote', 'corn on the cob, mayonnaise, cotija cheese, chili powder, lime, salt', 'Griglia il mais, spalma con maionese, cospargi di formaggio cotija e polvere di peperoncino, termina con lime.', 15, 'Facile', 'Messicana'),
(148, 'Menudo', 'beef tripe, hominy, red chili, garlic, onions, oregano, lime', 'Cuoci il trippa in un brodo speziato con hominy e chili per ore, servendo con cipolla fresca e lime.', 180, 'Difficile', 'Messicana'),
(149, 'Hamburger', 'ground beef, burger buns, lettuce, tomato, onion, cheese, pickles, ketchup, mustard', 'Forma delle polpette di manzo, grigliale e servi nel panino con i condimenti preferiti.', 20, 'Facile', 'Americana'),
(150, 'Fried Chicken', 'chicken pieces, flour, buttermilk, spices, oil, salt, pepper', 'Marina il pollo nel latticello, infarinalo con spezie e friggilo fino a ottenere una croccantezza uniforme.', 45, 'Medio', 'Americana'),
(151, 'Mac and Cheese', 'macaroni, cheddar cheese, milk, butter, flour, salt, pepper', 'Prepara una besciamella con burro, farina e latte, unisci il formaggio fuso e mescola con la pasta, infine gratina.', 30, 'Facile', 'Americana'),
(152, 'Buffalo Wings', 'chicken wings, hot sauce, butter, garlic powder, salt, pepper', 'Friggi le ali di pollo, poi condiscile con una salsa piccante a base di burro e hot sauce.', 35, 'Medio', 'Americana'),
(153, 'Apple Pie', 'apples, pie crust, sugar, cinnamon, nutmeg, butter, lemon juice', 'Farcisci una crostata con mele a fette condite, copri con pasta e cuoci in forno fino a doratura.', 90, 'Difficile', 'Americana'),
(154, 'Clam Chowder', 'clams, potatoes, onions, celery, cream, bacon, butter, thyme, salt, pepper', 'Prepara una zuppa cremosa con vongole, patate e bacon, aromatizzata con timo e burro.', 45, 'Medio', 'Americana'),
(155, 'Meatloaf', 'ground beef, breadcrumbs, eggs, onions, ketchup, mustard, herbs, salt, pepper', 'Mescola gli ingredienti, forma un filone e cuoci in forno fino a ottenere una consistenza morbida e saporita.', 60, 'Medio', 'Americana'),
(156, 'Barbecue Ribs', 'pork ribs, barbecue sauce, dry rub spices, oil, salt, pepper', 'Condisci le costine con una miscela di spezie, cuoci a bassa temperatura e poi glassa con salsa barbecue.', 180, 'Difficile', 'Americana'),
(157, 'Caesar Salad', 'romaine lettuce, croutons, parmesan, anchovies, Caesar dressing, lemon', 'Mescola lattuga croccante con crostini, parmigiano e dressing al limone, completando con acciughe se desiderato.', 15, 'Facile', 'Americana'),
(158, 'Lobster Roll', 'lobster meat, hot dog buns, mayonnaise, lemon juice, celery, salt, pepper', 'Mescola la polpa di aragosta con maionese e limone, farcisci panini imburrati e servi subito.', 20, 'Medio', 'Americana'),
(159, 'Philly Cheesesteak', 'thinly sliced beef, hoagie rolls, onions, bell peppers, provolone cheese, oil, salt, pepper', 'Salta il manzo con cipolle e peperoni, riempi il panino e copri con formaggio fuso.', 30, 'Medio', 'Americana'),
(160, 'Pecan Pie', 'pecans, corn syrup, sugar, eggs, butter, pie crust, vanilla', 'Prepara un ripieno a base di sciroppo e noci pecan, versalo in una base di pasta e cuoci fino a solidificazione.', 60, 'Difficile', 'Americana'),
(161, 'Cornbread', 'cornmeal, flour, eggs, milk, butter, sugar, baking powder, salt', 'Mescola gli ingredienti, versa in una teglia e cuoci in forno fino a ottenere una consistenza soffice e dorata.', 30, 'Facile', 'Americana'),
(162, 'Jambalaya', 'rice, chicken, sausage, shrimp, tomatoes, onions, bell peppers, spices, broth', 'Salta carne e verdure, aggiungi riso e brodo, e cuoci fino a che il tutto risulti ben amalgamato.', 60, 'Difficile', 'Americana'),
(163, 'Chicken Pot Pie', 'chicken, mixed vegetables, pie crust, cream, chicken broth, flour, butter, salt, pepper', 'Prepara un ripieno cremoso di pollo e verdure, copri con pasta sfoglia e cuoci fino a doratura.', 75, 'Difficile', 'Americana'),
(164, 'Moussaka', 'eggplant, ground lamb, tomatoes, béchamel, onions, garlic, olive oil, spices', 'Stratifica melanzane fritte con ragù di agnello, ricopri di besciamella e cuoci in forno fino a doratura.', 90, 'Difficile', 'Mediterranea'),
(165, 'Greek Salad', 'tomatoes, cucumbers, red onion, feta cheese, olives, olive oil, oregano, lemon', 'Mescola verdure fresche con feta e olive, condisci con olio d\'oliva e limone, e spolvera di origano.', 15, 'Facile', 'Mediterranea'),
(166, 'Souvlaki', 'pork or chicken, lemon, oregano, garlic, olive oil, salt, pepper, pita', 'Marina la carne con limone e erbe, grigliala su spiedini e servi in pita con tzatziki.', 30, 'Facile', 'Mediterranea'),
(167, 'Spanakopita', 'phyllo dough, spinach, feta cheese, onions, dill, eggs, olive oil, salt, pepper', 'Farcisci strati di pasta fillo con spinaci e feta, cuoci in forno fino a ottenere una superficie croccante.', 50, 'Difficile', 'Mediterranea'),
(168, 'Dolmades', 'grape leaves, rice, pine nuts, herbs, lemon juice, olive oil, salt, pepper', 'Mescola riso con pinoli e erbe, avvolgi in foglie di vite e cuoci a fuoco lento in brodo aromatizzato al limone.', 60, 'Medio', 'Mediterranea'),
(169, 'Tzatziki', 'yogurt, cucumber, garlic, olive oil, dill, lemon juice, salt', 'Grattugia il cetriolo, mescola con yogurt, aglio e aneto, aggiungi limone e lascia raffreddare.', 10, 'Facile', 'Mediterranea'),
(170, 'Baklava', 'phyllo dough, walnuts, pistachios, butter, honey, sugar, cinnamon', 'Disponi noci tritate tra fogli di pasta sfoglia imburrata, cuoci e condisci con sciroppo di miele e zucchero.', 90, 'Difficile', 'Mediterranea'),
(171, 'Gyro', 'pita, lamb or chicken, tomatoes, onions, tzatziki, lettuce, spices', 'Arrostisci la carne, affettala sottilmente e servi in pita con verdure fresche e salsa tzatziki.', 40, 'Medio', 'Mediterranea'),
(172, 'Fasolada', 'white beans, tomatoes, carrots, celery, onions, olive oil, garlic, herbs', 'Cuoci fagioli bianchi con verdure a cubetti e erbe fino a ottenere una zuppa rustica e saporita.', 90, 'Medio', 'Mediterranea'),
(173, 'Avgolemono Soup', 'chicken broth, eggs, lemon juice, rice or orzo, salt, pepper', 'Sbatti uova e limone, incorporale lentamente in brodo caldo con riso e mescola fino a ottenere una vellutata crema.', 25, 'Medio', 'Mediterranea'),
(174, 'Hummus', 'chickpeas, tahini, garlic, lemon juice, olive oil, salt, cumin', 'Frulla ceci, tahini, aglio e limone fino ad ottenere una crema liscia, condisci con olio e cumino.', 10, 'Facile', 'Mediorientale'),
(175, 'Falafel', 'chickpeas, garlic, onions, parsley, cumin, coriander, flour, oil, salt', 'Frulla ceci ammollati con erbe e spezie, forma delle palline e friggi fino a renderle croccanti.', 30, 'Medio', 'Mediorientale'),
(176, 'Shawarma', 'chicken or lamb, yogurt, garlic, lemon, spices, pita, vegetables, tahini', 'Marina la carne in yogurt e spezie, cuoci e affetta sottilmente, servi in pita con insalata e salsa tahini.', 60, 'Medio', 'Mediorientale'),
(177, 'Tabouleh', 'bulgur, tomatoes, cucumbers, parsley, mint, lemon juice, olive oil, salt', 'Mescola bulgur ammollato con verdure tritate, condisci con limone e olio d\'oliva, e servi fresco.', 20, 'Facile', 'Mediorientale'),
(178, 'Baba Ganoush', 'eggplant, tahini, garlic, lemon juice, olive oil, salt, smoked paprika', 'Arrostisci la melanzana, frulla la polpa con tahini e condimenti, e servi con un filo d\'olio.', 25, 'Facile', 'Mediorientale'),
(179, 'Kibbeh', 'bulgur, ground lamb, onions, pine nuts, spices, salt, pepper', 'Mescola bulgur e agnello speziato, forma dei cilindri o polpette e cuoci al forno o friggi.', 45, 'Difficile', 'Mediorientale'),
(180, 'Fattoush', 'mixed greens, tomatoes, cucumbers, radishes, pita croutons, sumac, lemon, olive oil', 'Unisci verdure fresche con crostini di pita, condisci con limone, olio e una spolverata di sumac.', 15, 'Facile', 'Mediorientale'),
(181, 'Mansaf', 'lamb, rice, jameed (fermented yogurt), almonds, pine nuts, spices, flatbread', 'Cuoci l\'agnello in una salsa a base di yogurt fermentato, servi sopra riso e guarnisci con frutta secca e pane.', 120, 'Difficile', 'Mediorientale'),
(182, 'Maqluba', 'chicken or lamb, rice, eggplant, cauliflower, tomatoes, spices, herbs', 'Disponi carne e verdure in strati in una pentola con riso, cuoci lentamente e capovolgi per servire a strati.', 90, 'Difficile', 'Mediorientale'),
(183, 'Kofta', 'ground meat, onions, garlic, parsley, spices, salt, pepper', 'Mescola carne macinata con aromi, forma polpette o cilindri e cuoci alla griglia o in forno.', 30, 'Facile', 'Mediorientale'),
(184, 'Pad Thai', 'rice noodles, shrimp or tofu, eggs, bean sprouts, peanuts, tamarind, fish sauce, lime, garlic', 'Idrata i noodles, saltali con proteine, uovo e germogli e condisci con una salsa agrodolce al tamarindo, guarnendo con arachidi.', 30, 'Medio', 'Thailandese'),
(185, 'Green Curry', 'chicken, green curry paste, coconut milk, eggplant, bamboo shoots, basil, fish sauce, sugar', 'Cuoci pollo e verdure in latte di cocco e pasta di curry verde, terminando con basilico fresco.', 40, 'Difficile', 'Thailandese'),
(186, 'Tom Yum Soup', 'shrimp, mushrooms, lemongrass, kaffir lime leaves, galangal, chili, lime juice, fish sauce, broth', 'Prepara un brodo piccante e acido con erbe aromatiche, aggiungi gamberi e funghi, finisci con lime.', 25, 'Medio', 'Thailandese'),
(187, 'Massaman Curry', 'beef, potatoes, peanuts, Massaman curry paste, coconut milk, tamarind, spices, onions', 'Cuoci lentamente la carne con patate e arachidi in un ricco curry a base di latte di cocco e spezie, fino a renderla tenera.', 60, 'Difficile', 'Thailandese'),
(188, 'Som Tum', 'green papaya, tomatoes, green beans, peanuts, garlic, chili, lime juice, fish sauce, palm sugar', 'Taglia a julienne la papaya, mescola con verdure e condisci con un dressing agrodolce e piccante.', 20, 'Facile', 'Thailandese'),
(189, 'Red Curry', 'chicken, red curry paste, coconut milk, bamboo shoots, bell peppers, basil, fish sauce', 'Cuoci il pollo e le verdure in una cremosa salsa al curry rosso, completando con basilico fresco.', 35, 'Medio', 'Thailandese'),
(190, 'Pad See Ew', 'wide rice noodles, beef or chicken, broccoli, egg, soy sauce, garlic', 'Salta in padella noodles larghi con carne, broccoli e uovo, insaporendo con salsa di soia.', 25, 'Facile', 'Thailandese'),
(191, 'Tom Kha Gai', 'chicken, coconut milk, galangal, lemongrass, kaffir lime leaves, mushrooms, chili, lime juice', 'Cuoci il pollo in latte di cocco con erbe aromatiche, concludendo con una spruzzata di lime per un gusto fresco.', 30, 'Medio', 'Thailandese'),
(192, 'Larb', 'minced meat, lime juice, fish sauce, mint, cilantro, chili, toasted rice powder', 'Mescola carne macinata cotta con erbe fresche e lime, aggiungi riso tostato in polvere per un tocco croccante.', 20, 'Facile', 'Thailandese'),
(193, 'Khao Pad', 'rice, eggs, vegetables, chicken or shrimp, soy sauce, garlic, onions', 'Salta il riso con uova, verdure e proteine, condisci con salsa di soia e servi caldo.', 20, 'Facile', 'Thailandese'),
(194, 'Pho', 'beef or chicken, rice noodles, herbs, broth, star anise, cloves, ginger, onions', 'Prepara un brodo aromatico con spezie, cuoci noodles e sottili fette di carne, e guarnisci con erbe fresche e lime.', 60, 'Difficile', 'Vietnamita'),
(195, 'Banh Mi', 'baguette, pork or chicken, pickled vegetables, cilantro, chili, pâté, mayonnaise', 'Farcisci una baguette croccante con carne marinata, verdure in salamoia, pâté e maionese.', 25, 'Medio', 'Vietnamita'),
(196, 'Vietnamese Spring Rolls', 'rice paper, shrimp, vegetables, rice noodles, herbs, lettuce, dipping sauce', 'Ammorbidisci la carta di riso, farciscila con gamberi, verdure e noodles, arrotola e servi con salsa d\'arachidi.', 20, 'Facile', 'Vietnamita'),
(197, 'Bun Cha', 'grilled pork, rice vermicelli, herbs, lettuce, pickled vegetables, dipping sauce', 'Servi carne di maiale grigliata su vermicelli di riso con verdure fresche e salsa acidula.', 30, 'Medio', 'Vietnamita'),
(198, 'Cao Lau', 'thick noodles, pork, greens, crispy croutons, herbs, broth, spices', 'Combina noodles spessi con fette di maiale, verdure e crostini, conditi con un leggero brodo speziato.', 35, 'Medio', 'Vietnamita'),
(199, 'Com Tam', 'broken rice, grilled pork, pickled vegetables, egg, fish sauce, herbs', 'Servi riso spezzato con maiale grigliato, uovo fritto e verdure sottaceto, il tutto condito con salsa di pesce.', 30, 'Facile', 'Vietnamita'),
(200, 'Bun Bo Hue', 'beef, rice noodles, lemongrass, shrimp paste, chili, herbs, broth', 'Prepara un brodo speziato con citronella e pasta di gamberi, aggiungi noodles e fettine di manzo, guarnisci con erbe fresche.', 50, 'Difficile', 'Vietnamita'),
(201, 'Xoi', 'sticky rice, mung beans, coconut milk, sugar, salt, toppings (peanuts, fried shallots)', 'Cuoci il riso glutinoso, mescola con fagioli mung e latte di cocco, e guarnisci con arachidi e cipollotti fritti.', 40, 'Facile', 'Vietnamita'),
(202, 'Banh Xeo', 'rice flour, turmeric, coconut milk, shrimp, pork, bean sprouts, herbs, lettuce', 'Prepara una pastella colorata con curcuma e latte di cocco, friggi con gamberi e maiale, piega e servi con insalata e erbe.', 30, 'Medio', 'Vietnamita'),
(203, 'Jerk Chicken', 'chicken, allspice, scotch bonnet peppers, thyme, garlic, ginger, lime, soy sauce, salt', 'Marina il pollo con una miscela di spezie jerk, griglialo fino a ottenere una crosta affumicata e servi con contorni freschi.', 45, 'Difficile', 'Caraibica'),
(204, 'Caribbean Roti', 'flour, water, oil, salt, curry-spiced filling (chicken or vegetables)', 'Prepara un impasto morbido, farcisci con un curry speziato e arrotola, ideale da gustare caldo.', 30, 'Medio', 'Caraibica'),
(205, 'Rice and Peas', 'rice, kidney beans, coconut milk, garlic, thyme, scallions, salt', 'Cuoci il riso insieme ai fagioli in latte di cocco e aromi fino a ottenere un piatto profumato.', 40, 'Facile', 'Caraibica'),
(206, 'Ackee and Saltfish', 'ackee, saltfish, onions, tomatoes, bell peppers, scotch bonnet, oil, salt, pepper', 'Soffriggi il saltfish con verdure, unisci l’ackee delicatamente e servi senza romperlo, mantenendo la consistenza.', 35, 'Difficile', 'Caraibica'),
(207, 'Curry Goat', 'goat meat, curry powder, garlic, onions, tomatoes, potatoes, herbs, chili, oil', 'Marina la carne di capra con curry e spezie, poi cuoci a fuoco lento con patate fino a renderla estremamente tenera.', 120, 'Difficile', 'Caraibica'),
(208, 'Jamaican Patties', 'flour, beef, onions, scallions, curry powder, turmeric, butter, water, salt', 'Prepara una pasta sfoglia, farcisci con un ripieno di manzo ben speziato e cuoci in forno fino a doratura.', 50, 'Medio', 'Caraibica'),
(209, 'Conch Fritters', 'conch meat, flour, eggs, bell peppers, onions, spices, baking powder, oil', 'Mescola la carne di conchiglia con una pastella aromatica, forma dei ciambelline e friggi fino a renderle croccanti.', 35, 'Medio', 'Caraibica'),
(210, 'Callaloo Soup', 'callaloo leaves, okra, coconut milk, onions, garlic, tomatoes, spices, salt', 'Cuoci le foglie di callaloo con okra, pomodori e latte di cocco fino a ottenere una zuppa ricca e vellutata.', 40, 'Medio', 'Caraibica'),
(211, 'Fried Plantains', 'plantains, oil, salt', 'Taglia i platani a fette e friggi fino a ottenere una doratura caramellata, spolvera di sale.', 15, 'Facile', 'Caraibica'),
(212, 'Rum Cake', 'flour, sugar, eggs, butter, rum, dried fruits, baking powder, spices', 'Prepara un impasto ricco, cuoci in forno e irrora con uno sciroppo al rum mentre è ancora caldo.', 90, 'Difficile', 'Caraibica'),
(213, 'Schnitzel', 'veal or pork, flour, eggs, breadcrumbs, oil, lemon, salt, pepper', 'Battete sottilmente la carne, infarinatela, passatela in uovo e pangrattato e friggetela fino a doratura, servendo con limone.', 30, 'Facile', 'Tedesca'),
(214, 'Bratwurst', 'pork sausage, spices, herbs, mustard, buns, sauerkraut', 'Grigliate le salsicce e servitele in panini con senape e crauti.', 25, 'Facile', 'Tedesca'),
(215, 'Sauerbraten', 'beef roast, vinegar, onions, carrots, spices, raisins, ginger snap cookies', 'Marinate il roast beef in aceto e spezie per giorni, poi brasatelo lentamente fino a renderlo estremamente tenero.', 240, 'Difficile', 'Tedesca'),
(216, 'Kartoffelsalat', 'potatoes, onions, vinegar, mustard, oil, herbs, salt, pepper', 'Cuocete le patate, tagliatele a fette e condite con una vinaigrette a base di senape e erbe.', 30, 'Facile', 'Tedesca'),
(217, 'Pretzels', 'flour, water, yeast, salt, baking soda, butter', 'Preparate l\'impasto, formate i tradizionali nodi, sbollentateli in soluzione alcalina e cuocete in forno fino a doratura.', 60, 'Medio', 'Tedesca'),
(218, 'Spätzle', 'flour, eggs, water, salt, butter', 'Mescolate gli ingredienti per ottenere una pastella densa, fate cadere piccole gocce in acqua bollente, poi saltatele in padella con burro.', 30, 'Facile', 'Tedesca'),
(219, 'Black Forest Cake', 'chocolate cake, cherries, whipped cream, kirsch, chocolate shavings', 'Stratificate torta al cioccolato con panna montata e ciliegie, impregnando con kirsch e guarnendo con scaglie di cioccolato.', 120, 'Difficile', 'Tedesca'),
(220, 'Rouladen', 'thin beef slices, mustard, bacon, onions, pickles, broth, spices', 'Spalma la senape sulle fettine di manzo, aggiungi bacon, cipolle e cetriolini, arrotola e brasale in brodo fino a tenerezza.', 120, 'Difficile', 'Tedesca'),
(221, 'Currywurst', 'pork sausage, curry ketchup, curry powder, fries', 'Griglia la salsiccia, tagliala a fette e condiscila con ketchup speziato al curry, servita con patatine.', 20, 'Facile', 'Tedesca'),
(222, 'Kartoffelpuffer', 'potatoes, onions, eggs, flour, salt, pepper, oil', 'Grattugiate patate e cipolle, mescolate con uovo e farina, formate dei dischi e friggeteli fino a renderli croccanti.', 25, 'Facile', 'Tedesca'),
(223, 'Fish and Chips', 'white fish, potatoes, flour, beer, oil, salt, vinegar', 'Immergete il pesce in una pastella a base di birra, friggetelo e servitelo con patatine spesse e aceto di malto.', 40, 'Medio', 'Britannica'),
(224, 'Shepherd\'s Pie', 'ground lamb, vegetables, mashed potatoes, gravy, herbs, salt, pepper', 'Disponete un ragù di agnello e verdure in una teglia, coprite con purè di patate e gratinate in forno.', 60, 'Medio', 'Britannica'),
(225, 'Beef Wellington', 'beef tenderloin, puff pastry, mushrooms, prosciutto, mustard, egg, salt, pepper', 'Ricoprite il filetto di manzo con duxelles di funghi e prosciutto, avvolgetelo in pasta sfoglia e cuocete in forno fino a cottura media.', 120, 'Difficile', 'Britannica'),
(226, 'Bangers and Mash', 'sausages, potatoes, butter, milk, onions, gravy, salt, pepper', 'Servite salsicce grigliate su un letto di purè cremoso, accompagnate da una ricca salsa di cipolle.', 30, 'Facile', 'Britannica'),
(227, 'Irish Stew', 'lamb, potatoes, carrots, onions, garlic, herbs, broth, salt, pepper', 'Cuocete agnello e verdure in un brodo aromatico fino a ottenere uno stufato rustico e saporito.', 90, 'Medio', 'Britannica'),
(228, 'Corned Beef and Cabbage', 'corned beef, cabbage, potatoes, carrots, onions, mustard, spices', 'Bollite il corned beef con verdure fino a renderlo tenero, servite a fette con senape.', 120, 'Medio', 'Britannica'),
(229, 'Yorkshire Pudding', 'flour, eggs, milk, water, salt, beef drippings', 'Preparate una pastella liscia, versatela in teglia con grasso bollente e cuocete fino a ottenere un pudding gonfio e dorato.', 30, 'Medio', 'Britannica'),
(230, 'Ploughman\'s Lunch', 'cheddar cheese, crusty bread, pickles, cold cuts, apple, salad', 'Componete un piatto rustico con formaggi, pane croccante, sottaceti e salumi assortiti.', 10, 'Facile', 'Britannica'),
(231, 'Eton Mess', 'strawberries, meringue, whipped cream, sugar, mint', 'Sbriciolate la meringa e mescolatela con fragole e panna montata per un dessert disordinato e delizioso.', 15, 'Facile', 'Britannica'),
(232, 'Welsh Rarebit', 'cheddar cheese, beer, mustard, Worcestershire sauce, bread, butter, salt, pepper', 'Prepara una salsa di formaggio con birra e senape, spalma su fette di pane tostato e gratina brevemente.', 20, 'Medio', 'Britannica'),
(233, 'Swedish Meatballs', 'ground beef, ground pork, breadcrumbs, onions, cream, allspice, nutmeg, butter, salt, pepper', 'Mescola carni e spezie, forma polpettine, friggi e servi con una salsa cremosa a base di panna.', 40, 'Medio', 'Scandinava'),
(234, 'Gravlax', 'salmon, salt, sugar, dill, lemon zest', 'Marinate il salmone con sale, zucchero e aneto per almeno 24 ore, poi affettatelo sottilmente.', 1440, 'Difficile', 'Scandinava'),
(235, 'Smørrebrød', 'rye bread, butter, assorted toppings (fish, meats, cheeses), herbs', 'Spalma burro su pane di segale e guarnisci con una varietà di affettati e formaggi, decorando con erbe fresche.', 15, 'Facile', 'Scandinava'),
(236, 'Raggmunk', 'potatoes, flour, eggs, milk, salt, oil', 'Grattugia patate, mescola con farina, uova e latte, forma delle frittelle e friggi fino a renderle croccanti.', 30, 'Medio', 'Scandinava'),
(237, 'Danish Pastry', 'flour, butter, yeast, milk, sugar, eggs, salt', 'Prepara un impasto laminato con strati di burro, forma dolci sfogliati e cuoci fino a ottenere una consistenza friabile.', 180, 'Difficile', 'Scandinava'),
(238, 'Lohikeitto', 'salmon, potatoes, carrots, leeks, cream, dill, fish stock, salt, pepper', 'Cuoci salmone e verdure in brodo di pesce, aggiungi panna e aneto e servi caldo.', 40, 'Medio', 'Scandinava'),
(239, 'Norwegian Salmon Soup', 'salmon, potatoes, carrots, leeks, cream, fish stock, dill, salt, pepper', 'Prepara una zuppa di salmone con patate e verdure, completata con panna e aneto fresco.', 35, 'Medio', 'Scandinava'),
(240, 'Feijoada', 'black beans, pork, beef, sausages, onions, garlic, bay leaves, orange, rice', 'Cuoci a fuoco lento fagioli neri con un misto di carni, servendo con riso e fette d\'arancia.', 180, 'Difficile', 'Latinoamericana'),
(241, 'Empanadas Salteñas', 'flour, beef, potatoes, peas, onions, spices, eggs, olives, oil', 'Prepara dei dischi di pasta ripieni di carne e patate speziata, richiudili e cuoci al forno o friggi.', 50, 'Medio', 'Latinoamericana'),
(242, 'Peruvian Ceviche', 'fresh fish, lime juice, red onion, cilantro, chili, salt', 'Marina il pesce a cubetti nel succo di lime, mescola con cipolla rossa e coriandolo e servi freddo.', 20, 'Facile', 'Latinoamericana'),
(243, 'Aji de Gallina', 'shredded chicken, aji amarillo, bread, milk, walnuts, cheese, garlic, onions', 'Cuoci il pollo sfilacciato in una cremosa salsa a base di pane ammollato e aji amarillo, completando con noci e formaggio.', 45, 'Medio', 'Latinoamericana'),
(244, 'Lomo Saltado', 'beef, tomatoes, onions, soy sauce, vinegar, fries, cilantro, rice', 'Salta il manzo con pomodori e cipolle, mescola con patatine fritte e servi su letto di riso, guarnendo con coriandolo.', 30, 'Medio', 'Latinoamericana'),
(245, 'Pabellón Criollo', 'shredded beef, black beans, rice, plantains, spices, garlic, onions', 'Servi carne sfilacciata con fagioli neri, riso e platani fritti per un piatto bilanciato e saporito.', 60, 'Medio', 'Latinoamericana'),
(246, 'Arepas', 'cornmeal, water, salt, cheese or meat filling', 'Impasta farina di mais con acqua e sale, forma dischi, cuoci su piastra e farcisci con formaggio o carne.', 25, 'Facile', 'Latinoamericana'),
(247, 'Chivito', 'steak, bread, ham, cheese, eggs, tomatoes, lettuce, mayonnaise', 'Assembla un panino robusto con bistecca grigliata, prosciutto, formaggio e verdure fresche.', 20, 'Facile', 'Latinoamericana'),
(248, 'Moqueca', 'fish, coconut milk, tomatoes, onions, garlic, cilantro, dendê oil, lime', 'Cuoci il pesce in una ricca salsa di latte di cocco e dendê, con pomodori e aromi, servendo con riso.', 50, 'Difficile', 'Latinoamericana'),
(249, 'Bandeja Paisa', 'beans, rice, ground beef, chorizo, fried egg, plantains, avocado, arepa, pork rind', 'Componi un piatto abbondante con carni, fagioli, riso, platani fritti ed uovo, tipico della cucina colombiana.', 90, 'Difficile', 'Latinoamericana'),
(250, 'Borscht', 'beetroot, cabbage, potatoes, carrots, onions, garlic, beef broth, sour cream, dill', 'Cuoci le verdure in brodo di manzo, servi la zuppa di barbabietola calda con un cucchiaio di panna acida e aneto fresco.', 60, 'Medio', 'Europea'),
(251, 'Pierogi', 'flour, potatoes, cheese, onions, eggs, salt, butter', 'Prepara la pasta, farcisci con un ripieno di patate e formaggio, bolli e poi salta in padella con burro.', 45, 'Medio', 'Europea'),
(252, 'Beef Stroganoff', 'beef, mushrooms, onions, sour cream, mustard, beef broth, butter, flour, salt, pepper', 'Rosola il manzo con funghi e cipolle, aggiungi brodo e panna acida per una salsa cremosa, servi con tagliatelle.', 40, 'Medio', 'Europea'),
(253, 'Chicken Kiev', 'chicken breasts, butter, garlic, parsley, flour, eggs, breadcrumbs, oil, salt, pepper', 'Riempi le petto di pollo con burro alle erbe, impana e friggi, ottenendo un esterno croccante con un cuore filante.', 50, 'Difficile', 'Europea'),
(254, 'Blini with Caviar', 'blini, buckwheat flour, milk, eggs, butter, caviar, sour cream', 'Prepara piccoli pancake di grano saraceno, servili caldi con una cucchiaiata di panna e caviale.', 30, 'Medio', 'Europea'),
(255, 'Carbonara', 'pasta, guanciale, eggs, pecorino romano, black pepper, salt', 'Cuoci la pasta, rosola il guanciale, mescola con uova e pecorino, amalgama con la pasta calda.', 25, 'Medio', 'Italiana'),
(256, 'Peking Duck', 'duck, maltose syrup, five-spice powder, cucumber, scallions, pancakes, hoisin sauce', 'Arrostisci l\'anatra dopo una fase di essiccazione e glassatura, poi servi con pancake, cetriolo, cipollotti e salsa hoisin.', 180, 'Difficile', 'Cinese'),
(257, 'Paella de Marisco', 'rice, seafood, saffron, bell peppers, tomatoes, olive oil, broth', 'Soffriggi i peperoni, aggiungi riso, brodo e zafferano, completa con frutti di mare e cuoci fino a perfetta assorbenza.', 60, 'Difficile', 'Spagnola'),
(258, 'Ratatouille', 'eggplant, zucchini, bell peppers, tomatoes, onions, garlic, olive oil, herbs', 'Disponi le verdure a fette o a cubetti in una teglia, condisci con olio ed erbe e cuoci in forno lentamente.', 90, 'Medio', 'Francese'),
(259, 'Bibimbap', 'rice, beef, egg, spinach, carrots, gochujang, sesame oil, garlic', 'Salta le verdure separatamente, cuoci la carne, servi sul riso con un uovo fritto e condisci con gochujang.', 40, 'Medio', 'Coreana'),
(260, 'Pad Thai', 'rice noodles, shrimp or tofu, eggs, bean sprouts, peanuts, tamarind, fish sauce, lime, garlic', 'Idrata i noodles, saltali con proteine, uovo e germogli e condisci con una salsa agrodolce al tamarindo, guarnendo con arachidi.', 30, 'Medio', 'Thailandese'),
(261, 'Borscht', 'beetroot, cabbage, potatoes, carrots, onions, garlic, beef broth, sour cream, dill', 'Cuoci le verdure in brodo di manzo, servi la zuppa di barbabietola calda con un cucchiaio di panna acida e aneto fresco.', 60, 'Medio', 'Europea'),
(262, 'Moussaka', 'eggplant, ground lamb, tomatoes, béchamel, onions, garlic, olive oil, spices', 'Stratifica melanzane fritte con ragù di agnello, ricopri di besciamella e cuoci in forno fino a doratura.', 90, 'Difficile', 'Mediterranea');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricette_regione`
--

CREATE TABLE `ricette_regione` (
  `id` int NOT NULL,
  `foto` varchar(255) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `regione` varchar(50) NOT NULL,
  `difficolta` enum('Facile','Medio','Difficile') NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `ricette_regione`
--

INSERT INTO `ricette_regione` (`id`, `foto`, `titolo`, `regione`, `difficolta`, `descrizione`) VALUES
(1, 'https://upload.wikimedia.org/wikipedia/commons/d/d8/Campo_Imperatore_2009_-Ristoro_Mucciante_Arrosticini-_by_RaBoe_014.jpg', 'Arrosticini', 'Abruzzo', 'Medio', 'Spiedini di pecora tagliata a cubetti, cotti alla brace e serviti con pane casereccio. Richiede una buona gestione della brace.'),
(2, 'https://www.eurcamping.it/wp-content/uploads/WhatsApp-Image-2019-03-28-at-19.55.21.jpeg', 'Chitarra Abruzzese', 'Abruzzo', 'Difficile', 'Pasta fresca all’uovo tagliata con la chitarra, servita con ragù di agnello e aromi tipici abruzzesi.'),
(3, 'https://media-assets.lacucinaitaliana.it/photos/6517f33719381bfc78d39be8/4:3/w_1084,h_813,c_limit/GettyImages-639339988.jpg', 'Pasta e Fagioli Lucana', 'Basilicata', 'Facile', 'Piatto rustico a base di pasta corta, fagioli borlotti e pomodoro, insaporito con aromi locali e un pizzico di peperoncino.'),
(4, 'https://c8.alamy.com/compit/2gpgn5t/preparazione-della-tradizionale-salsa-hogao-o-criollo-colombiana-a-base-di-cipolla-pomodoro-peperoni-e-coriandolo-2gpgn5t.jpg', 'Peperoni Criolla', 'Basilicata', 'Medio', 'Peperoni freschi cucinati con aglio, olio e erbe aromatiche, serviti come contorno o antipasto.'),
(7, 'https://upload.wikimedia.org/wikipedia/commons/c/c8/Pizza_Margherita_stu_spivack.jpg', 'Pizza Margherita', 'Campania', 'Medio', 'Impasto lievitato a lungo, condito con salsa di pomodoro, mozzarella di bufala e basilico fresco.'),
(8, 'https://www.tavolartegusto.it/wp/wp-content/uploads/2024/03/sfogliatelle-sfogliatelle-ricce-napoletane.jpg', 'Sfogliatella', 'Campania', 'Difficile', 'Dolce tipico napoletano a base di pasta sfoglia ripiena di ricotta e semolino, dalla forma caratteristica.'),
(9, 'https://www.ricettedalmondo.it/images/foto-ricette/l/29109-lasagne-alla-bolognese.jpg', 'Lasagne alla Bolognese', 'Emilia-Romagna', 'Difficile', 'Strati di pasta all’uovo, ragù bolognese, besciamella e parmigiano, cotti al forno per un risultato ricco e saporito.'),
(10, 'https://d2sj0xby2hzqoy.cloudfront.net/kenwood_italy/attachments/data/000/010/046/medium/tortellini-brodo.jpg', 'Tortellini in Brodo', 'Emilia-Romagna', 'Medio', 'Piccoli tortellini ripieni serviti in un ricco brodo di carne, simbolo della tradizione culinaria emiliana.'),
(11, 'https://cdn.robadadonne.it/wp-content/uploads/sites/4/2017/07/28214330/98c64cfde82f22fa751ffa6a9855064d.jpg', 'Frico', 'Friuli-Venezia-Giulia', 'Facile', 'Frittella croccante a base di formaggio fuso e patate, servita calda, simbolo della tradizione friulana.'),
(12, 'https://www.discover-trieste.it/proxyvfs.axd/img_full/r15714/file-jpg?v=14309&ext=.jpg', 'Jota', 'Friuli-Venezia-Giulia', 'Medio', 'Zuppa rustica a base di crauti, fagioli e patate, arricchita da pancetta e aromi locali.'),
(13, 'https://cucinacongabry.altervista.org/wp-content/uploads/2024/01/0D174AA7-A14D-474D-BDF9-688A113FA766-scaled.jpeg', 'Carciofi alla Romana', 'Lazio', 'Facile', 'Carciofi ripieni di prezzemolo, aglio e menta, cotti lentamente in olio extravergine d’oliva secondo la ricetta tradizionale romana.'),
(14, 'https://www.todis.it/wp-content/uploads/2023/09/pasta-allamatriciana.jpg', 'Pasta all\'Amatriciana', 'Lazio', 'Medio', 'Pasta con guanciale, pomodoro e pecorino, con un pizzico di peperoncino, tipica del territorio di Amatrice.'),
(15, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/0802C73C-3213-4AA6-BD3E-7390A13989FF/Derivates/ff280a78-bfae-46c9-9ea8-c63f5508cde8.jpg', 'Pasta al Pesto Genovese', 'Liguria', 'Medio', 'Pasta (trofie o trenette) condita con pesto fresco preparato con basilico, pinoli, aglio, parmigiano e olio extravergine d’oliva.'),
(16, 'https://www.giallozafferano.it/images/224-22468/Focaccia-fugassa-alla-genovese_450x300.jpg', 'Focaccia Ligure', 'Liguria', 'Facile', 'Focaccia morbida e profumata, tipica della tradizione genovese, da gustare calda con un filo d’olio extravergine d’oliva.'),
(17, 'https://safrescobaldistatic.blob.core.windows.net/media/2022/11/RISOTTO-ALLA-MILANESE.jpg', 'Risotto alla Milanese', 'Lombardia', 'Medio', 'Risotto cremoso aromatizzato con zafferano, burro, brodo e parmigiano, simbolo della tradizione milanese.'),
(18, 'https://images.fidhouse.com/fidelitynews/wp-content/uploads/sites/6/2014/10/Cotoletta-alla-milanese-52520-1.jpg?width=1280&height=720&quality=90', 'Cotoletta alla Milanese', 'Lombardia', 'Difficile', 'Fetta di vitello impanata e fritta, servita con una leggera insalata, tipica della cucina lombarda.'),
(19, 'https://www.lanuovafazenda.it/wp-content/uploads/2019/07/shutterstock_739787011-900x600.jpg', 'Vincisgrassi', 'Marche', 'Difficile', 'Pasta al forno stratificata con ragù di carne, besciamella e parmigiano, variante delle lasagne tipiche marchigiane.'),
(20, 'https://www.giallozafferano.it/images/ricette/2/253/foto_hd/hd650x433_wm.jpg', 'Olive all\'Ascolana', 'Marche', 'Medio', 'Olive ripiene di carne, impanate e fritte, un antipasto croccante e saporito, molto diffuso nelle Marche.'),
(21, 'https://www.foodblog.it/wp-content/uploads/2021/02/cavatelli-alla-materana.jpg', 'Cavatelli con Sugo di Agnello', 'Molise', 'Medio', 'Cavatelli fatti in casa con un ricco sugo di agnello, pomodoro e aromi locali, preparati secondo la tradizione molisana.'),
(22, 'https://static.wixstatic.com/media/fe2898_13239c0d91124e3c94e50606629f5db1~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/fe2898_13239c0d91124e3c94e50606629f5db1~mv2.jpg', 'Pampanella', 'Molise', 'Difficile', 'Carne di maiale marinata in aromi e cotta al forno, un piatto robusto e saporito della cucina molisana.'),
(23, 'https://primochef.it/wp-content/uploads/2019/03/SH_bagnacauda.jpg', 'Bagna Cauda', 'Piemonte', 'Facile', 'Fonduta calda a base di aglio, acciughe e olio d’oliva, servita con verdure crude o cotte, simbolo della convivialità piemontese.'),
(24, 'https://www.chezuppa.com/wp-content/uploads/2021/10/risotto-funghi-porcini02.jpg', 'Risotto ai Funghi Porcini', 'Piemonte', 'Medio', 'Risotto cremoso preparato con funghi porcini freschi, burro e una nota di tartufo, tipico del territorio piemontese.'),
(25, 'https://blog.giallozafferano.it/dulcisinforno/wp-content/uploads/2021/01/Orecchiette-con-cime-di-rapa-3139.jpg', 'Orecchiette alle Cime di Rapa', 'Puglia', 'Medio', 'Orecchiette fatte a mano, saltate con cime di rapa, aglio, acciughe e peperoncino, un piatto ricco di sapori mediterranei.'),
(26, 'https://www.ricetteperbimby.it/foto-ricette/focaccia-pugliese-bimby.jpg', 'Focaccia Pugliese', 'Puglia', 'Facile', 'Focaccia soffice e profumata, arricchita con pomodorini, olive e origano, ideale per un pranzo leggero.'),
(27, 'https://cottoecrudo.it/wp-content/uploads/2021/01/Seadas.png', 'Seadas', 'Sardegna', 'Difficile', 'Dolce tipico sardo: fagottini di pasta fritta ripieni di formaggio fresco, serviti con abbondante miele.'),
(28, 'https://www.melarossa.it/wp-content/uploads/2021/04/culurgiones-ingredienti.jpg', 'Culurgiones', 'Sardegna', 'Medio', 'Ravioli tradizionali sardi ripieni di patate, pecorino e menta, conditi con un semplice sugo al pomodoro.'),
(29, 'https://www.sicilianfood.it/cms/sw_images/ricette/shutterstock31994154241.jpg', 'Caponata Siciliana', 'Sicilia', 'Facile', 'Antipasto a base di melanzane, pomodori, capperi, olive e sedano, insaporito da aceto e zucchero per un perfetto equilibrio agrodolce.'),
(30, 'https://www.ricettedalmondo.it/images/foto-ricette/a/31173-arancini-siciliani-ds.jpg', 'Arancini di Riso', 'Sicilia', 'Medio', 'Polpette di riso farcite con ragù, piselli e mozzarella, fritte fino a doratura, tipiche della tradizione siciliana.'),
(31, 'https://www.cibovagare.it/uploads/2020/10/12/bistecca-fiorentina-buca-mario.png', 'Bistecca alla Fiorentina', 'Toscana', 'Difficile', 'Grossa bistecca di manzo (chianina) cotta al sangue su brace, condita con sale, pepe e un filo d’olio extravergine.'),
(32, 'https://www.giallozafferano.it/images/8-843/Pappa-col-pomodoro_650x433_wm.jpg', 'Pappa al Pomodoro', 'Toscana', 'Facile', 'Zuppa densa a base di pane toscano raffermo, pomodoro, aglio, basilico e olio extravergine, perfetta per le giornate fredde.'),
(33, 'https://www.fattoincasadabenedetta.it/wp-content/uploads/2018/11/strudel-di-mele-1000x560-sito.jpg', 'Strudel di Mele', 'Trentino-Alto-Adige', 'Medio', 'Dolce a base di pasta sfoglia ripiena di mele, uvetta e cannella, arrotolata e cotta al forno fino a doratura.'),
(34, 'https://www.giallozafferano.it/images/ricette/219/21953/foto_hd/hd650x433_wm.jpg', 'Canederli', 'Trentino-Alto-Adige', 'Medio', 'Gnocchi di pane tipici altoatesini, serviti in brodo o con burro fuso e salvia.'),
(35, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Torta_al_testo.jpg/320px-Torta_al_testo.jpg', 'Torta al Testo', 'Umbria', 'Facile', 'Focaccia tipica umbra cotta su pietra e farcita con salsiccia, ideale per un pranzo rustico.'),
(36, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Umbricelli_con_funghi.jpg/320px-Umbricelli_con_funghi.jpg', 'Umbricelli con Funghi', 'Umbria', 'Medio', 'Pasta fresca fatta in casa, condita con funghi porcini, prezzemolo e un tocco di tartufo.'),
(37, 'https://www.giallozafferano.it/images/223-22377/Fonduta-alla-Valdostana_780x520_wm.jpg', 'Fonduta Valdostana', 'Valle-d-Aosta', 'Medio', 'Fonduta cremosa a base di fontina valdostana, arricchita da latte e noce moscata, servita con crostini di pane.'),
(38, 'https://www.cucchiaio.it/content/dam/cucchiaio/it/ricette/2009/12/ricetta-polenta-concia/_R5_7588.jpg', 'Polenta Concia', 'Valle-d-Aosta', 'Facile', 'Polenta morbida con formaggio fuso e burro, un piatto tradizionale valdostano ricco e saporito.'),
(39, 'https://ricetta.it/Uploads/Imgs/baccala-mantecato.jpg.webp', 'Baccalà Mantecato', 'Veneto', 'Medio', 'Crema spalmabile preparata con baccalà ammollato, olio extravergine, latte e aglio, tipico antipasto veneziano.'),
(40, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Risi-e-Bisi.jpg/640px-Risi-e-Bisi.jpg', 'Risi e Bisi', 'Veneto', 'Facile', 'Risotto cremoso a base di piselli freschi, pancetta e parmigiano, un classico della tradizione veneta.'),
(105, 'https://staticcookist.akamaized.net/wp-content/uploads/sites/21/2022/07/peperoni-cruschi-1.jpg', 'Peperoni Cruschi', 'Basilicata', 'Facile', 'Peperoni essiccati e fritti, croccanti e saporiti.'),
(106, 'https://cdn-media.italiani.it/site-matera/sites/46/2021/10/strascinati-con-i-peperoni-cruschi-800x600.jpg', 'Strascinati con Mollica e Peperoni Cruschi', 'Basilicata', 'Medio', 'Pasta tipica con mollica di pane croccante e peperoni.'),
(107, 'https://i0.wp.com/gastronomica-mente.it/wp-content/uploads/2022/05/nduja-9.jpg?fit=2048%2C1365&ssl=1', 'Fileja con Nduja', 'Calabria', 'Medio', 'Pasta fresca tipica con nduja e pomodoro.'),
(108, 'https://www.giallozafferano.it/images/ricette/0/27/foto_hd/hd650x433_wm.jpg', 'Morzello', 'Calabria', 'Difficile', 'Piatto tradizionale di trippa con sugo piccante.'),
(113, 'https://ricette.giallozafferano.it/Frico.html', 'Frico', 'Friuli-Venezia Giulia', 'Facile', 'Piatto a base di formaggio Montasio fuso con patate e cipolle.'),
(114, 'https://www.tasteatlas.com/jota', 'Jota', 'Friuli-Venezia Giulia', 'Medio', 'Zuppa di fagioli, crauti e patate.'),
(115, 'https://blog.giallozafferano.it/dulcisinforno/wp-content/uploads/2021/03/Carbonara-ricetta-5328.jpg', 'Pasta alla Carbonara', 'Lazio', 'Facile', 'Pasta con uova, guanciale e pecorino romano.'),
(116, 'https://www.casapappagallo.it/storage/17171/coda-alla-vaccinara.jpg', 'Coda alla Vaccinara', 'Lazio', 'Difficile', 'Coda di bue brasata con pomodoro e verdure.'),
(118, 'https://www.sicilianicreativiincucina.it/wp-content/uploads/2016/03/farinatadiceci3.jpg', 'Farinata di Ceci', 'Liguria', 'Facile', 'Sottile torta salata a base di farina di ceci.'),
(120, 'https://www.chefpercaso.it/wp-content/uploads/2020/06/ossobuco_blog.jpg', 'Ossobuco alla Milanese', 'Lombardia', 'Difficile', 'Stinco di vitello in umido con gremolata.'),
(122, 'https://www.repstatic.it/content/nazionale/img/2020/04/01/112144983-6c538fb3-6b39-4481-890d-f91e1c96e226.jpg', 'Brodetto marchigiano', 'Marche', 'Medio', 'Zuppa di pesce con pomodoro.'),
(124, 'https://www.wpri.com/wp-content/uploads/sites/23/2023/01/trattoria-zooma-pasta-close.jpg', 'Cavatelli con Salsiccia e Broccoli', 'Molise', 'Medio', 'Pasta fresca con salsiccia e broccoli.'),
(125, 'https://www.lacucinaimperfetta.com/wp-content/uploads/2013/05/Vitello-tonnato.jpg', 'Vitello Tonnato', 'Piemonte', 'Medio', 'Vitello affettato con salsa al tonno.'),
(128, 'https://www.laterradipuglia.it/wp-content/uploads/IMG_2802-1024x683.jpg', 'Riso, Patate e Cozze', 'Puglia', 'Medio', 'Sformato di riso con cozze e patate.'),
(129, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/05860fdb-ea9f-4495-af67-b1a054de3926/Derivates/7322620e-c164-43fe-8be6-a4f632416aa4.jpg', 'Malloreddus alla Campidanese', 'Sardegna', 'Medio', 'Pasta con sugo di salsiccia e zafferano.'),
(130, 'https://www.salepepe.it/files/2015/04/porceddu1-1140x636.jpg', 'Porceddu', 'Sardegna', 'Difficile', 'Maialino da latte cotto allo spiedo.'),
(131, 'https://images.dissapore.com/wp-content/uploads/2022/06/pasta-alla-norma-ricetta.jpg?width=1280&height=720&quality=20', 'Pasta alla Norma', 'Sicilia', 'Facile', 'Pasta con melanzane, ricotta salata e pomodoro.'),
(132, 'https://www.fattoincasadabenedetta.it/wp-content/uploads/2017/03/anteprima-14-scaled.jpg', 'Cannoli Siciliani', 'Sicilia', 'Difficile', 'Dolci croccanti ripieni di ricotta e canditi.'),
(134, 'https://passioneperlatavola.it/wp-content/uploads/2021/11/ribollita-toscana-0-scaled.jpg.webp', 'Ribollita', 'Toscana', 'Medio', 'Zuppa di pane con cavolo nero e fagioli.'),
(135, 'https://www.cucchiaio.it/content/cucchiaio/it/ricette/2016/10/baccala-alla-vicentina/_jcr_content/header-par/image-single.img.jpg/1476289449480.jpg', 'Baccalà alla Vicentina', 'Veneto', 'Difficile', 'Baccalà cotto lentamente con latte e cipolle.'),
(136, 'https://blog.giallozafferano.it/allacciateilgrembiule/wp-content/uploads/2021/09/FEGATO-ALLA-VENEZIANA-720x480.jpg', 'Fegato alla Veneziana', 'Veneto', 'Medio', 'Fegato di vitello con cipolle bianche.'),
(137, 'https://ricette.giallozafferano.it/Brovada-e-Muset.html', 'Brovada e Muset', 'Friuli-Venezia Giulia', 'Medio', 'Piatto invernale a base di rape fermentate e cotechino.'),
(138, 'https://ricette.giallozafferano.it/Frico.html', 'Frico', 'Friuli-Venezia Giulia', 'Facile', 'Frittata di formaggio Montasio con patate e cipolle.'),
(139, 'https://ricette.giallozafferano.it/Gubana.html', 'Gubana', 'Friuli-Venezia Giulia', 'Difficile', 'Dolce a base di pasta lievitata ripiena di frutta secca e grappa.'),
(140, 'https://ricette.giallozafferano.it/Cjarsons.html', 'Cjarsons', 'Friuli-Venezia Giulia', 'Difficile', 'Ravioli dolci e salati con ripieno di erbe e spezie.'),
(143, 'https://langhe.net/wp-content/uploads/2011/01/DSC_0727.jpg', 'Bunet', 'Piemonte', 'Facile', 'Dolce al cucchiaio con cacao, amaretti e liquore.'),
(144, 'https://wips.plug.it/cips/buonissimo.org/cms/2011/10/agnolotti-del-plin.jpg?w=712&a=c&h=406', 'Agnolotti del Plin', 'Piemonte', 'Difficile', 'Pasta ripiena di carne brasata, chiusa con il tipico pizzicotto.'),
(146, 'https://www.casapappagallo.it/storage/15332/seupa-a-la-valpe-llinentze.jpg', 'Seupa à la Valpellinentze', 'Valle-d-Aosta', 'Medio', 'Zuppa di pane raffermo, Fontina e brodo di carne.'),
(147, 'https://www.cuoredicioccolato.it/wp-content/uploads/2023/12/mocetta.jpg', 'Mocetta', 'Valle-d-Aosta', 'Facile', 'Carne stagionata di bovino o camoscio, aromatizzata con erbe alpine.'),
(148, 'https://staticcookist.akamaized.net/wp-content/uploads/sites/21/2022/10/tegole-dolci-finale-2.jpg', 'Tegole Valdostane', 'Valle-d-Aosta', 'Facile', 'Biscotti croccanti a base di nocciole e mandorle.'),
(149, 'https://www.ricettedalmondo.it/images/foto-ricette/s/26031-spaghetti-al-pomodoro-fresco.jpg', 'pasta alla teresa', 'calabria', 'Facile', 'pasta con i pomodorini freschi'),
(150, 'https://i1.wp.com/www.piccolericette.net/piccolericette/wp-content/uploads/2015/11/1698_Pizzoccheri.jpg?resize=895%2C616&ssl=1', 'Pizzoccheri della Valtellina', 'lombardia', 'Facile', 'Primo piatto, invernale, composto da verza, patate, burro, pasta e formaggio \\\"puzzone di Moena\\\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`FirstName`, `LastName`, `username`, `email`, `password`) VALUES
('admin', 'admin', 'admin', 'admin@admin.it', '$argon2id$v=19$m=65536,t=4,p=1$cHgxc2tVaTBiUEdkbk9NRQ$4MEO9sF+Pqzmj7VZ6wYQLj7ia9gGlb1Qqw2PdRhabvI'),
('Demetrio', 'Priolo', 'dem01', 'demetrio.priolo2003@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$M1JRb1ZKOU43bHJ3cU1neA$b9OrEWEv/WiCCBRriuIyszuh8V8eY59icXLy1ZEWBy0'),
('veli', 'mori', 'velimori', 'veliamariadecicco@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$UEtpOHozV0ZFMTBXTVlmVw$dorxurFLQP/s0rzHbws2BZRh8gv4fjL2eL/pgfREz84'),
('demetrio', 'priolo', 'dem', 'priolod29@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$YS50MVZ0RGt5Smd2MXdKdQ$tPROMxBwGQjyQs0u3kaFGcifsiMmEKQXZNce+02fcCg'),
('teresa', 'arico', 'terry', 'teresa.arico@yahoo.it', '$argon2id$v=19$m=65536,t=4,p=1$Q2I0ZnlzcE1xMnJ3aThwVw$+N0i/Udl7eWWSf769vN0Zt27KQu6NT6+MyjJRxZmnxI');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ricette`
--
ALTER TABLE `ricette`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ricette_regione`
--
ALTER TABLE `ricette_regione`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ricette`
--
ALTER TABLE `ricette`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT per la tabella `ricette_regione`
--
ALTER TABLE `ricette_regione`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
