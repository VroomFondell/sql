use aquarium;

insert into customer
values
	(default, 'Smith', 'John', '555-1111'),
    (default, 'Smith', 'Jane', '555-2222'),
    (default, 'Anta', 'Hamza', '666-1111');
    
insert into Aquarium
values
	(default, 'Black', 20),
    (default, 'Wood', 60),
    (default, 'Wood', 120);

insert into Pump
values
	(default, 'Fresh', 5),
    (default, 'Fresh', 15),
    (default, 'Salt', 30);
    
insert into Fish
values
	(default, 'Tetra', 'Fresh'),
    (default, 'Bard', 'Fresh'),
    (default, 'Tang', 'Salt'),
    (default, 'Firefish', 'Salt');
    
insert into `Order`
values
	(default, 1, 1, 1),
    (default, 1, 1, 2),
    (default, 2, 2, 3),
    (default, 2, 2, 2),    
    (default, 3, 3, 3);
    
insert into OrderFish
values
	(1, 1, 2),
    (2, 1, 2),
    (2, 2, 2),
    (3, 2, 4),    
    (4, 1, 4),
    (4, 2, 4),
    (5, 3, 3),
    (5, 4, 3);
    
