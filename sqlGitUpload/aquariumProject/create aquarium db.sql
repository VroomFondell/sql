create database Aquarium;

use Aquarium;

create table Customer
(
	CustomerId		int				primary key		auto_increment,
    CustomerLName	varchar(15)		not null,
    CustomerFName	varchar(15)		not null,
    CustomerPhone	char(10)		not null
);

create index idx_CustomerId
on Customer (CustomerId);

create index idx_CustomerPhone
on Customer (CustomerPhone);

create table Fish
(
	FishId		int							primary key		auto_increment,
    FishName	varchar(20)					not null,
    FishType	enum('Salt', 'Fresh')		not null
);

create table Pump
(
	PumpId				int						primary key		auto_increment,
    PumpType			enum('Salt', 'Fresh')	not null,
    PumpFlowRateGPM		smallint(4)				not null
);

create table Aquarium
(
	AquariumId			int						primary key		auto_increment,
    AquariumFinish		enum('Wood', 'Black')	not null,
    AquariumGallons		smallint(3)				not null
);

create table OrderFish
(
	OrderNum		int			not null,
    FishId			int			not null,
    OrderFishCount	tinyint(2)	not null
);


create table `Order`
(
	OrderNum		int		primary key		auto_increment,
    AquariumId		int		not null,
    PumpId			int		not null,
    CustomerId		int		not null,
    
    constraint	FK_AquariumId_AquariumId	foreign key	(AquariumId)	references Aquarium (AquariumId),
	constraint	FK_PumpId_PumpId			foreign key	(PumpId)		references Pump (PumpId),
	constraint	FK_CustomerId_CustomerId	foreign key	(CustomerId)	references Customer (CustomerId)
);

alter table orderfish

	add constraint							primary key	(OrderNum, FishId),
    add constraint	FK_OrderNum_OrderNum	foreign key	(OrderNum)	references `Order` (OrderNum),
	add constraint	FK_FishId_FishId		foreign key	(FishId)	references Fish (FishId)
;
