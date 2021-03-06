#function returns petshop name
def pet_shop_name(shop)
    return shop[:name]
end
#function returns shops total cash value
def total_cash(shop)
    return shop.dig(:admin, :total_cash)
end
#adds or removes cash transaction from total cash
def add_or_remove_cash(shop, cash_amount)
    shop[:admin][:total_cash] += cash_amount
end
#returns amount of pets sold
def pets_sold(shop)
    return shop.dig(:admin, :pets_sold)
end
# adds or subtracts number of pet sale transactions
def increase_pets_sold(shop, sold_amount)
    shop[:admin][:pets_sold] += sold_amount
end
#return current pet stock
def stock_count(shop)
    return shop[:pets].length
end
#return array of pet hash data that matches breed
def pets_by_breed(shop, breed)
    matched_breeds = {}
    matched_breeds = shop[:pets].keep_if{|shop_pets| shop_pets[:breed] == breed}
    return matched_breeds
end
#find pet by name then return it
def find_pet_by_name(shop, pet_name)
    for pet in shop[:pets]
        if pet[:name] == pet_name
            return pet
        end
    end
    return nil
end
#remove pet by name
def remove_pet_by_name(shop, pet_name)
 shop[:pets].delete_if{|pet_info|pet_info[:name] == pet_name}
end
#add pet to stock
def add_pet_to_stock(shop,new_animal)
    shop[:pets] << new_animal
end
#check a customers cash amount
def customer_cash(customer_cash_amount)
return customer_cash_amount[:cash]
end
#remove customer cash
def remove_customer_cash(customer, cash_value)
customer[:cash] -= cash_value
end
#count customers pets
def customer_pet_count(customer)
return customer[:pets].length
end
#add a new pet for the customer
def add_pet_to_customer(customer, new_friend)
    customer[:pets] << new_friend
end
#check if customer can afford pet
def customer_can_afford_pet(customer,new_friend)
 return (customer[:cash] >= new_friend[:price])? true : false
end
#sell pet to customer
def sell_pet_to_customer(shop,the_pet,the_customer)
    if the_pet != nil
        add_pet_to_customer(the_customer,the_pet)
        shop[:admin][:pets_sold] +=1
        remove_customer_cash(the_customer,the_pet[:price])
        add_or_remove_cash(shop,the_pet[:price])
    # else
    #     shop[:admin][:pets_sold] +=1
    end
end
