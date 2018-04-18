
require 'sinatra'
require 'shotgun'
require 'sendgrid-ruby'
include SendGrid



# bakery hash

bakery = {
    :all => {},
    :cookies => {},
    :muffins => {},
    :cakes => {}
}


# product classes  (product classes should have a display method? or should it be an )

class Cookie
    attr_accessor :image_link, :name, :price, :description
    def initialize(image_link, name, price, description)
        @image_link = image_link
        @name = name
        @price = price
        @description =  description
    end
end

class Muffin
    attr_accessor :image_link, :name, :price, :description
    def initialize(image_link, name, price, description)
        @image_link = image_link
        @name = name
        @price = price
        @description =  description
    end
end

class Cake
    attr_accessor :image_link, :name, :price, :description
    def initialize(image_link, name, price, description)
        @image_link = image_link
        @name = name
        @price = price
        @description =  description
    end
end


#cookies
choc_chip = Cookie.new("imgs/cookies/choc_chip_cookie.png", "chocolate chip cookie", "$7", "a chocolaty chocolate chip cookie")
bakery[:cookies][:choc_chip] = choc_chip

p_butter = Cookie.new("imgs/cookies/p_butter_cookie.png", "peanut butter cookie", "$7", "delicious peanut butter, mmmhhhh...")
bakery[:cookies][:p_butter] = p_butter

o_raisin = Cookie.new("imgs/cookies/o_raisin_cookie.png", "oatmeal raisin cookie", "$7", "break it up in your morning oatmeal")
bakery[:cookies][:o_raisin] = o_raisin

macadamian = Cookie.new("imgs/cookies/macadamian_cookie.png", "macadamia nuts cookie", "$7", "you too will like to be macadamian")
bakery[:cookies][:macadamian] = macadamian

empire = Cookie.new("imgs/cookies/empire_cookie.png", "empire cookies", "$7", "lovely empire cookies, great for dessert")
bakery[:cookies][:empire] = empire

puts bakery[:cookies][:p_butter].name
puts bakery[:cookies][:p_butter].price
puts bakery[:cookies][:p_butter].description 
puts bakery[:cookies]


#muffins
choc_chip = Muffin.new("imgs/muffins/choc_chip_muffin.png", "chocolate chip muffin", "$10", "a chocolaty chocolate chip muffin")
bakery[:muffins][:choc_chip] = choc_chip

blueberry = Muffin.new("imgs/muffins/blueberry_muffin.png", "blueberry muffin", "$10", "a delicious burst of fresh blueberries")
bakery[:muffins][:blueberry] = blueberry

corn = Muffin.new("imgs/muffins/cornbread_muffin.png", "cornbread muffin", "$10", "elegant cornbread cookies, munch on!")
bakery[:muffins][:corn] = corn

banana = Muffin.new("imgs/muffins/banana_muffin.png", "banana muffin", "$10", "a chocolaty chocolate chip cookie")
bakery[:muffins][:banana] = banana

m_glory = Muffin.new("imgs/muffins/m_glory_muffin.png", "morning glory muffin", "$10", "a chocolaty chocolate chip cookie")
bakery[:muffins][:m_glory] = m_glory

puts bakery[:muffins][:banana].name
puts bakery[:muffins][:banana].price
puts bakery[:muffins][:banana].description
puts bakery[:muffins]


#cakes
coffee = Cake.new("imgs/cakes/coffee_cake.png", "coffee cake", "$77", "have a slice with your morning coffee")
bakery[:cakes][:coffee] = coffee

red_v = Cake.new("imgs/cakes/red_velvet_cake.png", "red velvet cake", "$57", "you'll feel like you're on the red carptet")
bakery[:cakes][:red_v] = red_v

rum = Cake.new("imgs/cakes/rum_cake.png", "rum cake", "$107", "this delicious rum cake will make you dance")
bakery[:cakes][:rum] = rum

dbl_choc = Cake.new("imgs/cakes/double_chocolate_cake.png", "double chocolate cake", "$87", "a chocolaty double chocolate cake")
bakery[:cakes][:dbl_choc] = dbl_choc

german_choc = Cake.new("imgs/cakes/german_chocolate_cake.png", "german chocolate cake", "$47", "german chocolate cake with honey sour cream icing")
bakery[:cakes][:german_choc] = german_choc

puts bakery[:cakes][:dbl_choc].name
puts bakery[:cakes][:dbl_choc].price
puts bakery[:cakes][:dbl_choc].description
puts bakery[:cakes]





#display functions - might have to recreate these in erb view for a dynamic <ul> with full classes for easy targeted styling 

def display_all(bakery)
    bakery.each do |key, value|
        key.each do |key, value|
            puts key.price
            puts key.description
        end
    end
end


def display(product_category)
    item_list.each do |key, value|
        puts key.price
        puts key.description
    end
end





#routes

get '/' do
    erb :index
end

get '/:page' do |page|
    @home_url = "localhost:9393/"
    @bakery = bakery

    if page == "all"
        erb :all

    elsif page == "cookies"
        erb :cookies

    elsif page == "muffins"
        erb :muffins

    elsif page == "cakes"
        erb :cakes

    elsif page == "contact"
        erb :contact

    else
        erb :page_not_found
    end 
end


# attempt at select item route    ///   also check link is correct in product categories display loops / full name of item, no spaces
# <p class="purchase_link"> <a href=" <%=  @home_url + value2.name.split(' ').join  %>" >add to bag</a></p>

# get '/:product' do |product|
#     for bakery[*].each do |key, value|
#         if key.name == product
#             erb : key.name
#         end
#     end 
# end



# use this syntax if you'd like to specify a template other than layout (you still have to <%= yield %> wherever in your new template you'd like the view to be embedded)

#erb :index, :layout => :posts_template



# use this syntax for nested template file embedding

# erb :site_layout, :layout => false do
#     erb :region_layout do
#       erb :page
#     end
# end