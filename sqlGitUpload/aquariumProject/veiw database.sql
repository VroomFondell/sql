select *
from Aquarium;

select *
from Pump;

select *
from customer;

select *
from Fish;

select *
from `Order`;

select *
from OrderFish;

Select CustomerLName, CustomerFName, FishName, FishType
from customer
	join `order`
		on customer.CustomerId = `order`.CustomerId
    join orderfish
		on orderfish.OrderNum = `order`.OrderNum
	join fish
		on orderfish.FishId = fish.FishId
	where customer.CustomerId = 3;
    

Select CustomerFName, sum(OrderFishCount) as fish_purchased
from customer
	join `order`
		on customer.CustomerId = `order`.CustomerId
    join orderfish
		on orderfish.OrderNum = `order`.OrderNum
	where customer.CustomerId = 2;