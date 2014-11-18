USE shortjm;

CREATE TABLE Hotels
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(500) NOT NULL,
	picture_location VARCHAR(500),
	PRIMARY KEY(id)
);

CREATE TABLE Restaurants
(
	id INT NOT NULL AUTO_INCREMENT,
	restaurant_name VARCHAR(500),	
	hotel INT NOT NULL,
	Button_Image VARCHAR(500),
	Advertising_Image VARCHAR(500),
	Description VARCHAR(1000),
	FOREIGN KEY (hotel) REFERENCES Hotels(id),
	PRIMARY KEY(id)
);


CREATE TABLE Categories
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(500),
	restaurant INT,
	FOREIGN KEY(restaurant) REFERENCES Restaurants(id),
	PRIMARY KEY(id)
);

CREATE TABLE MenuItems
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(500),
	category INT,
	description VARCHAR(2000),
	picture_file VARCHAR(500),
	price NUMERIC(6,2),
	review_image_location VARCHAR(500),
	FOREIGN KEY (category) REFERENCES Categories(id),
	PRIMARY KEY (id)
);

CREATE TABLE Ingredients
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(2000),
	in_stock BIT,
	restaurant INT,
	FOREIGN KEY (restaurant) REFERENCES Restaurants(id),
	PRIMARY KEY (id)
);

CREATE TABLE IngredientsInItems
(
	menu_item INT,
	ingredient INT,
	essential BIT,
	PRIMARY KEY (menu_item)
	PRIMARY KEY (ingredient)
	FOREIGN KEY (menu_item) REFERENCES MenuItems(id),
	FOREIGN KEY (ingredient) REFERENCES Ingredients(id)
);