#function returns petshop name
def pet_shop_name(shop)
    return shop[:name]
end
#function returns shops total cash value
def total_cash(shop)
    return shop.dig(:admin, :total_cash)
end

def add_or_remove_cash(shop, cash_amount)
    shop[:admin][:total_cash] += cash_amount
end

def pets_sold(shop)
    return shop.dig(:admin, :pets_sold)
end

def increase_pets_sold(shop, sold_amount)
    shop[:admin][:pets_sold] += sold_amount
end
