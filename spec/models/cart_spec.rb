require 'rails_helper'

describe Cart do 
  before :each do 
    @cart  = create(:cart)
    @book_one = create(:product)
    @book_two  = create(:product)
  end

  it "has unique products" do 
    @cart.add_product(@book_one).save!
    @cart.add_product(@book_two).save!
    expect(@cart.line_items.size).to eq(2)
    expect(@book_one.price + @book_two.price).to eq(@cart.total_price)
  end
  it "has duplicate products" do 
    @cart.add_product(@book_one).save!
    @cart.add_product(@book_one).save!
    expect(@cart.line_items.size).to eq(1)
    expect(@book_one.price*2).to eq(@cart.total_price)
  end
end