#---
# Excerpted from "Agile Web Development with Rails 5",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails5 for more book information.
#---
# encoding: utf-8
Product.delete_all

10.times do
  Product.create(title:  Faker::Book.title ,
  description: Faker::Lorem.paragraph,
  image_url: Faker::LoremPixel.image("200x200", false, 'business'),    
  price:  Faker::Commerce.price)
end