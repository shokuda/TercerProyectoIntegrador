DROP SCHEMA IF EXISTS `Trailerflix` ;
CREATE SCHEMA IF NOT EXISTS `Trailerflix` ;
USE `Trailerflix` ;
DROP TABLE IF EXISTS `Trailerflix`.`actricesyactores` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`actricesyactores` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE INDEX `idActor` (`idActor` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Trailerflix`.`generos` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`generos` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idGenero`),
  UNIQUE INDEX `idGenero` (`idGenero` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Trailerflix`.`categorias` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`categorias` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `idCategoria` (`idCategoria` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Trailerflix`.`contenidos` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`contenidos` (
  `idContenido` INT NOT NULL AUTO_INCREMENT,
  `poster` VARCHAR(80) NOT NULL,
  `titulo` VARCHAR(80) NOT NULL,
  `temporadas` VARCHAR(3) NOT NULL,
  `resumen` TEXT NOT NULL,
  `trailer` VARCHAR(120) NOT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`idContenido`),
  UNIQUE INDEX `idContenido` (`idContenido` ASC) VISIBLE,
  INDEX `fk_contenido_categorias_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_contenido_categorias`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Trailerflix`.`categorias` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Trailerflix`.`contenido_generos` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`contenido_generos` (
  `idContenidoGenero` INT NOT NULL AUTO_INCREMENT,
  `idGenero` INT NOT NULL,
  `idContenido` INT NOT NULL,
  PRIMARY KEY (`idContenidoGenero`, `idGenero`, `idContenido`),
  UNIQUE INDEX `idContenidoGenero` (`idContenidoGenero` ASC) VISIBLE,
  INDEX `fk_Contenido_generos_generos1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Contenido_generos_contenido1_idx` (`idContenido` ASC) VISIBLE,
  CONSTRAINT `fk_Contenido_generos_generos1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `Trailerflix`.`generos` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenido_generos_contenido1`
    FOREIGN KEY (`idContenido`)
    REFERENCES `Trailerflix`.`contenidos` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Trailerflix`.`contenido_repartos` ;

CREATE TABLE IF NOT EXISTS `Trailerflix`.`contenido_repartos` (
  `idContenidoReparto` INT NOT NULL AUTO_INCREMENT,
  `idContenido` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idContenidoReparto`, `idContenido`, `idActor`),
  UNIQUE INDEX `idContenidoReparto` (`idContenidoReparto` ASC) VISIBLE,
  INDEX `fk_Contenido_repartos_contenido1_idx` (`idContenido` ASC) VISIBLE,
  INDEX `fk_Contenido_repartos_actricesyactores1_idx` (`idActor` ASC) VISIBLE,
  CONSTRAINT `fk_Contenido_repartos_contenido1`
    FOREIGN KEY (`idContenido`)
    REFERENCES `Trailerflix`.`contenidos` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenido_repartos_actricesyactores1`
    FOREIGN KEY (`idActor`)
    REFERENCES `Trailerflix`.`actricesyactores` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES  
(1, "serie"),
(2, "pelicula");

INSERT INTO `actricesyactores` (`idActor`,`nombre`) VALUES 
(1, "Pedro Pascal"),
(2, "Carl Weathers"),
(3, "Misty Rosas"),
(4, "Chris Bartlett"),
(5, "Rio Hackford"),
(6, "Giancarlo Esposito"),
(7, "Tom Hopper"),
(8, "David Castañeda"),
(9, "Emmy Raver-Lampman"),
(10, "Robert Sheehan"),
(11, "Aidan Gallagher"),
(12, "Elliot Page"),
(13, "Anya Taylor-Joy"),
(14, "Thomas Brodie-Sangster"),
(15, "Harry Melling"),
(16, "Moses Ingram"),
(17, "Chloe Pirrie"),
(18, "Janina Elkin"),
(19, "Lili Reinhart"),
(20, "Casey Cott"),
(21, "Camila Mendes"),
(22, "Marisol Nichols"),
(23, "Madelaine Petsch"),
(24, "Mädchen Amick"),
(25, "Claire Fox"),
(26, "Olivia Colman"),
(27, "Matt Smith"),
(28, "Tobias Menzies"),
(29, "Vanesa Kirby"),
(30, "Helena Bonham Carter"),
(31, "Millie Bobby Brown"),
(32, "Henry Cavill"),
(33, "Sam Claflin"),
(34, "Louis Partridge"),
(35, "Adeel Akhtar"),
(36, "Joaquin Phoenix"),
(37, "Robert De Niro"),
(38, "Zazie Beetz"),
(39, "Frances Conroy"),
(40, "Brett Cullen"),
(41, "Shea Whigham"),
(42, "Robert Downey Jr."),
(43, "Chris Evans"),
(44, "Mark Ruffalo"),
(45, "Chris Hemsworth"),
(46, "Scarlett Johansson"),
(47, "Jeremy Renner"),
(48, "Emilia Clarke"),
(49, "Lena Headey"),
(50, "Sophie Turner"),
(51, "Kit Harington"),
(52, "Peter Dinklage"),
(53, "Nikolaj Coster-Waldau"),
(54, "Grant Gustin"),
(55, "Carlos Valdes"),
(56, "Danielle Panabaker"),
(57, "Candice Patton"),
(58, "Jesse L. Martin"),
(59, "Tom Cavanagh"),
(60, "Jim Parsons"),
(61, "Johnny Galecki"),
(62, "Kaley Cuoco"),
(63, "Simon Helberg"),
(64, "Kunal Nayyar"),
(65, "Melissa Rauch"),
(66, "Mayim Bialik"),
(67, "Jennifer Aniston"),
(68, "Courteney Cox"),
(69, "Lisa Kudrow"),
(70, "David Schwimmer"),
(71, "Matthew Perry"),
(72, "Matt LeBlanc"),
(73, "Amybeth McNulty"),
(74, "Geraldine James"),
(75, "R. H. Thomson"),
(76, "Corrine Koslo"),
(77, "Dalila Bela"),
(78, "Lucas Jade Zumann"),
(79, "Gillian Anderson"),
(80, "David Duchovny"),
(81, "Mitch Pileggi"),
(82, "Robert Patrick"),
(83, "Tom Braidwood"),
(84, "Bruce Harwood"),
(85, "Jared Harris"),
(86, "Stellan Skarsgård"),
(87, "Emily Watson"),
(88, "Paul Ritter"),
(89, "Jessie Buckley"),
(90, "Adam Nagaitis"),
(91, "Evan Rachel Wood"),
(92, "Thandie Newton"),
(93, "Jeffrey Wright"),
(94, "Tessa Thompson"),
(95, "Ed Harris"),
(96, "Luke Hemsworth"),
(97, "Lee Pace"),
(98, "Scoot McNairy"),
(99, "Mackenzie Davis"),
(100, "Kerry Bishé"),
(101, "Toby Huss"),
(102, "Alana Cavanaugh"),
(103, "Jessica Chastain"),
(104, "John Malkovich"),
(105, "Colin Farrell"),
(106, "Common"),
(107, "Geena Davis"),
(108, "Ioan Gruffudd"),
(109, "Margot Robbie"),
(110, "Ewan McGregor"),
(111, "Mary Elizabeth Winstead"),
(112, "Jurnee Smollett"),
(113, "Rosie Perez"),
(114, "Chris Messina"),
(115, "Stacy Martin"),
(116, "Rhona Mitra"),
(117, "Theo James"),
(118, "Peter Ferdinando"),
(119, "Lia Williams"),
(120, "Toby Jones"),
(121, "Dwayne Johnson"),
(122, "Kevin Hart"),
(123, "Jack Black"),
(124, "Karen Gillan"),
(125, "Awkwafina"),
(126, "Nick Jonas"),
(127, "Miranda Cosgrove"),
(128, "Kate Walsh"),
(129, "Omar Epps"),
(130, "Angus Macfadyen"),
(131, "Jorja Fox"),
(132, "Enver Gjokaj"),
(133, "Bill Skarsgård"),
(134, "Bill Hader"),
(135, "James McAvoy"),
(136, "Isaiah Mustafa"),
(137, "Jay Ryan"),
(138, "Chadwick Boseman"),
(139, "Michael B. Jordan"),
(140, "Lupita Nyong'o"),
(141, "Danai Gurira"),
(142, "Martin Freeman"),
(143, "Daniel Kaluuya"),
(144, "Christian Bale"),
(145, "Matt Damon"),
(146, "Caitriona Balfe"),
(147, "Josh Lucas"),
(148, "Noah Jupe"),
(149, "Jon Bernthal"),
(150, "Génesis Rodríguez"),
(151, "Vincent Piazza"),
(152, "Benjamin Sokolow"),
(153, "Emily Bayiokos"),
(154, "Amy Manson"),
(155, "Luke Allen-Gale"),
(156, "Nina Bergman"),
(157, "Dominic Mafham"),
(158, "James Weber Brown"),
(159, "Lorina Kamburova"),
(160, "Marion Cotillard"),
(161, "Laurence Fishburne"),
(162, "Jude Law"),
(163, "Kate Winslet"),
(164, "Jennifer Ehle"),
(165, "Gwyneth Paltrow"),
(166, "Florence Pugh"),
(167, "David Harbour"),
(168, "O.T. Fagbenle"),
(169, "Rachel Weisz"),
(170, "William Hurt"),
(171, "Ray Winstone"),
(172, "Kristen Wiig"),
(173, "Jeff Daniels"),
(174, "Michael Peña"),
(175, "Sean Bean"),
(176, "Kate Mara"),
(177, "Alicia Vikander"),
(178, "Domhnall Gleeson"),
(179, "Oscar Isaac"),
(180, "Sonoya Mizuno"),
(181, "Corey Johnson"),
(182, "Claire Selby"),
(183, "Gana Bayarsaikhan"),
(184, "Bryce Dallas Howard"),
(185, "Chris Pratt"),
(186, "Irrfan Khan"),
(187, "Vincent D'Onofrio"),
(188, "Omar Sy"),
(189, "Nick Robinson"),
(190, "Judy Greer"),
(191, "Will Smith"),
(192, "Alice Braga"),
(193, "Charlie Tahan"),
(194, "Dash Mihok"),
(195, "Salli Richardson-Whitfield"),
(196, "Willow Smith"),
(197, "Emma Thompson"),
(198, "Ryan Gosling"),
(199, "Claire Foy"),
(200, "Jason Clarke"),
(201, "Kyle Chandler"),
(202, "Corey Stoll"),
(203, "Patrick Fugit"),
(204, "John Boyega"),
(205, "Scott Eastwood"),
(206, "Cailee Spaeny"),
(207, "Jing Tian"),
(208, "Rinko Kikuchi"),
(209, "Burn Gorman");

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(1, "Ciencia Ficción"),
(2, "Fantasía"),
(3, "Drama"),
(4, "Ficción"),
(5, "Sucesos"),
(6, "Misterio"),
(7, "Hechos verídicos"),
(8, "Crimen"),
(9, "Suspenso"),
(10, "Aventura"),
(11, "Sci-Fi"),
(12, "Acción"),
(13, "Comedia"),
(14, "Familia"),
(15, "Western"),
(16, "Tecnología"),
(17, "Terror"),
(18, "Historia"),
(19, "Intriga"),
(20, "¿Ficción?");

INSERT INTO `contenidos` (`idContenido`, `idCategoria`, `poster`, `titulo`, `temporadas`, `resumen`, `trailer`) VALUES 
(3, 1, "/posters/3.jpg", "The Mandalorian", "2", "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.", "https://www.youtube.com/embed/aOC8E8z_ifw"),
(4, 1, "/posters/4.jpg", "The Umbrella Academy", "1", "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.", ""),
(5, 1, "/posters/5.jpg", "Gambito de Dama", "1", "En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.", ""),
(2, 1, "/posters/2.jpg", "Riverdale", "5", "El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.", ""),
(1, 1, "/posters/1.jpg", "The Crown", "4", "Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.", ""),
(6, 2, "/posters/6.jpg", "Enola Holmes", "N/A", "La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.", ""),
(7, 2, "/posters/7.jpg", "Guasón", "N/A", "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.", "https://www.youtube.com/embed/zAGVQLHvwOY"),
(8, 2, "/posters/8.jpg", "Avengers: End Game", "N/A", "Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.", ""),
(9, 1, "/posters/9.jpg", "Juego de tronos", "8", "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.", ""),
(10, 1, "/posters/10.jpg", "The Flash", "6", "Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.", ""),
(11, 1, "/posters/11.jpg", "The Big Bang Theory", "12", "Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.", "https://www.youtube.com/embed/WBb3fojgW0Q"),
(12, 1, "/posters/12.jpg", "Friends", "10", "Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.", ""),
(13, 1, "/posters/13.jpg", "Anne with an 'E'", "2", "Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.", ""),
(14, 1, "/posters/14.jpg", "Expedientes Secretos 'X'", "11", "Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'", "https://www.youtube.com/embed/KKziOmsJxzE"),
(15, 1, "/posters/15.jpg", "Chernobyl", "1", "Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.", "https://www.youtube.com/embed/s9APLXM9Ei8"),
(16, 1, "/posters/16.jpg", "Westworld", "3", "Westworld es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.", "https://www.youtube.com/embed/qLFBcdd6Qw0"),
(17, 1, "/posters/17.jpg", "Halt and Catch Fire", "4", "Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).", "https://www.youtube.com/embed/pWrioRji60A"),
(18, 2, "/posters/18.jpg", "Ava", "N/A", "Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.", ""),
(19, 2, "/posters/19.jpg", "Aves de presa y la fantabulosa emancipación de una Harley Quinn", "N/A", "Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.", ""),
(20, 2, "/posters/20.jpg", "Archivo", "N/A", "2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.", "https://www.youtube.com/embed/VHSoCnDioAo"),
(21, 2, "/posters/21.jpg", "Jumanji - The next level", "N/A", "Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?", "https://www.youtube.com/embed/rBxcF-r9Ibs"),
(22, 2, "/posters/22.jpg", "3022", "N/A", "La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.", "https://www.youtube.com/embed/AGQ7OkmIx4Q"),
(23, 2, "/posters/23.jpg", "IT - Capítulo 2", "N/A", "En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.", "https://www.youtube.com/embed/hZeFeYSmBcg"),
(24, 2, "/posters/24.jpg", "Pantera Negra", "N/A", "T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.", "https://www.youtube.com/embed/BE6inv8Xh4A"),
(25, 2, "/posters/25.jpg", "Contra lo imposible (Ford versus Ferrari)", "N/A", "Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.", "https://www.youtube.com/embed/SOVb0-2g1Q0"),
(26, 2, "/posters/26.jpg", "Centígrados", "N/A", "Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.", ""),
(27, 2, "/posters/27.jpg", "DOOM: Aniquilación", "N/A", "Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.", "https://www.youtube.com/embed/nat3u3gAVLE"),
(28, 2, "/posters/28.jpg", "Contagio", "N/A", "De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.", "https://www.youtube.com/embed/4sYSyuuLk5g"),
(29, 2, "/posters/29.jpg", "Viuda Negra", "N/A", "Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.", "https://www.youtube.com/embed/BIn8iANwEog"),
(30, 2, "/posters/30.jpg", "The Martian", "N/A", "Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.", "https://www.youtube.com/embed/XvB58bCVfng"),
(31, 2, "/posters/31.jpg", "Ex-Machina", "N/A", "Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.", "https://www.youtube.com/embed/XRYL5spvEcI"),
(32, 2, "/posters/32.jpg", "Jurassic World", "N/A", "Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.", ""),
(33, 2, "/posters/33.jpg", "Soy leyenda", "N/A", "Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.", "https://www.youtube.com/embed/dtKMEAXyPkg"),
(34, 2, "/posters/34.jpg", "El primer hombre en la luna", "N/A", "Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.", ""),
(35, 2, "/posters/35.jpg", "Titanes del pacífico - La insurrección", "N/A", "Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.", "");

INSERT INTO `contenido_generos` (`idContenidoGenero`, `idContenido`, `idGenero`) VALUES 
(1, 3, 1),
(2, 3, 2),
(3, 4, 1),
(4, 4, 2),
(5, 5, 3),
(6, 5, 4),
(7, 5, 5),
(8, 2, 3),
(9, 2, 6),
(10, 2, 12),
(11, 1, 3),
(12, 1, 7),
(13, 6, 4),
(14, 6, 3),
(15, 6, 6),
(16, 7, 8),
(17, 7, 9),
(18, 7, 4),
(19, 8, 10),
(20, 8, 11),
(21, 8, 12),
(22, 9, 10),
(23, 9, 2),
(24, 9, 3),
(25, 10, 1),
(26, 10, 2),
(27, 11, 13),
(28, 11, 2),
(29, 11, 4),
(30, 12, 13),
(31, 12, 14),
(32, 12, 3),
(33, 13, 3),
(34, 13, 14),
(35, 13, 15),
(36, 14, 3),
(37, 14, 1),
(38, 15, 3),
(39, 15, 7),
(40, 16, 15),
(41, 16, 1),
(42, 17, 4),
(43, 17, 3),
(44, 17, 16),
(45, 18, 12),
(46, 18, 3),
(47, 18, 9),
(48, 19, 12),
(49, 19, 4),
(50, 19, 13),
(51, 20, 12),
(52, 20, 11),
(53, 20, 9),
(54, 21, 13),
(55, 21, 4),
(56, 21, 10),
(57, 22, 1),
(58, 22, 9),
(59, 23, 17),
(60, 23, 9),
(61, 23, 2),
(62, 24, 12),
(63, 24, 10),
(64, 24, 2),
(65, 25, 3),
(66, 25, 18),
(67, 25, 10),
(68, 26, 3),
(69, 26, 9),
(70, 26, 19),
(71, 27, 12),
(72, 27, 11),
(73, 27, 17),
(74, 28, 3),
(75, 28, 9),
(76, 28, 20),
(77, 29, 3),
(78, 29, 12),
(79, 29, 10),
(80, 30, 3),
(81, 30, 11),
(82, 30, 10),
(83, 31, 3),
(84, 31, 11),
(85, 31, 9),
(86, 32, 9),
(87, 32, 10),
(88, 32, 4),
(89, 33, 3),
(90, 33, 17),
(91, 33, 4),
(92, 34, 3),
(93, 34, 7),
(94, 35, 12),
(95, 35, 2),
(96, 35, 11);

INSERT INTO `contenido_repartos` (`idContenidoReparto`, `idContenido`, `idActor`) VALUES 
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 4, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 5, 16),
(17, 5, 17),
(18, 5, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 2, 22),
(23, 2, 23),
(24, 2, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 6, 31),
(32, 6, 32),
(33, 6, 33),
(34, 6, 30),
(35, 6, 34),
(36, 6, 35),
(37, 7, 36),
(38, 7, 37),
(39, 7, 38),
(40, 7, 39),
(41, 7, 40),
(42, 7, 41),
(43, 8, 42),
(44, 8, 43),
(45, 8, 44),
(46, 8, 45),
(47, 8, 46),
(48, 8, 47),
(49, 9, 48),
(50, 9, 49),
(51, 9, 50),
(52, 9, 51),
(53, 9, 52),
(54, 9, 53),
(55, 10, 54),
(56, 10, 55),
(57, 10, 56),
(58, 10, 57),
(59, 10, 58),
(60, 10, 59),
(61, 11, 60),
(62, 11, 61),
(63, 11, 62),
(64, 11, 63),
(65, 11, 64),
(66, 11, 65),
(67, 11, 66),
(68, 12, 67),
(69, 12, 68),
(70, 12, 69),
(71, 12, 70),
(72, 12, 71),
(73, 12, 72),
(74, 13, 73),
(75, 13, 74),
(76, 13, 75),
(77, 13, 76),
(78, 13, 77),
(79, 13, 78),
(80, 14, 79),
(81, 14, 80),
(82, 14, 81),
(83, 14, 82),
(84, 14, 83),
(85, 14, 84),
(86, 15, 85),
(87, 15, 86),
(88, 15, 87),
(89, 15, 88),
(90, 15, 89),
(91, 15, 90),
(92, 16, 91),
(93, 16, 92),
(94, 16, 93),
(95, 16, 94),
(96, 16, 95),
(97, 16, 96),
(98, 17, 97),
(99, 17, 98),
(100, 17, 99),
(101, 17, 100),
(102, 17, 101),
(103, 17, 102),
(104, 18, 103),
(105, 18, 104),
(106, 18, 105),
(107, 18, 106),
(108, 18, 107),
(109, 18, 108),
(110, 19, 109),
(111, 19, 110),
(112, 19, 111),
(113, 19, 112),
(114, 19, 113),
(115, 19, 114),
(116, 20, 115),
(117, 20, 116),
(118, 20, 117),
(119, 20, 118),
(120, 20, 119),
(121, 20, 120),
(122, 21, 121),
(123, 21, 122),
(124, 21, 123),
(125, 21, 124),
(126, 21, 125),
(127, 21, 126),
(128, 22, 127),
(129, 22, 128),
(130, 22, 129),
(131, 22, 130),
(132, 22, 131),
(133, 22, 132),
(134, 23, 133),
(135, 23, 104),
(136, 23, 134),
(137, 23, 135),
(138, 23, 136),
(139, 23, 137),
(140, 24, 138),
(141, 24, 139),
(142, 24, 140),
(143, 24, 141),
(144, 24, 142),
(145, 24, 143),
(146, 25, 144),
(147, 25, 145),
(148, 25, 146),
(149, 25, 147),
(150, 25, 148),
(151, 25, 149),
(152, 26, 150),
(153, 26, 151),
(154, 26, 152),
(155, 26, 153),
(156, 27, 154),
(157, 27, 155),
(158, 27, 156),
(159, 27, 157),
(160, 27, 158),
(161, 27, 159),
(162, 28, 160),
(163, 28, 147),
(164, 28, 161),
(165, 28, 162),
(166, 28, 163),
(167, 28, 164),
(168, 28, 165),
(169, 29, 47),
(170, 29, 166),
(171, 29, 167),
(172, 29, 168),
(173, 29, 169),
(174, 29, 170),
(175, 29, 171),
(176, 30, 147),
(177, 30, 104),
(178, 30, 172),
(179, 30, 173),
(180, 30, 174),
(181, 30, 175),
(182, 30, 176),
(183, 31, 177),
(184, 31, 178),
(185, 31, 179),
(186, 31, 180),
(187, 31, 181),
(188, 31, 182),
(189, 31, 183),
(190, 32, 184),
(191, 32, 185),
(192, 32, 186),
(193, 32, 187),
(194, 32, 188),
(195, 32, 189),
(196, 32, 190),
(197, 33, 191),
(198, 33, 192),
(199, 33, 193),
(200, 33, 194),
(201, 33, 195),
(202, 33, 196),
(203, 33, 197),
(204, 34, 198),
(205, 34, 199),
(206, 34, 200),
(207, 34, 201),
(208, 34, 202),
(209, 34, 203),
(210, 35, 204),
(211, 35, 205),
(212, 35, 206),
(213, 35, 207),
(214, 35, 208),
(215, 35, 209);