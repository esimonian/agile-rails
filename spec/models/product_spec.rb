require 'rails_helper'

describe Product do 
  it "has a valid factory" do 
    expect(build(:product)).to be_valid
  end

  it "has a postive price" do 
    product = build(:product, price: -1)
    product.valid?
    expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
    
    product.price = 0

    product.valid?
    expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
    
    product.price = 1
    expect(product).to be_valid
  end

  it "has a valid image url" do 
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      expect(build(:product, image_url: name)).to be_valid
    end

    bad.each do |name|
      expect(build(:product, image_url: name)).not_to be_valid
    end
  end

  it "is invalid with a duplicate title" do 
    create(:product, title: "Test Title")
    product = build(:product, title: "Test Title")
    product.valid?
    expect(product.errors[:title]).to include("has already been taken")
  end

 it "is invalid with a duplicate title - i18n" do 
    create(:product, title: "Test Title")
    product = build(:product, title: "Test Title")
    product.valid?
    expect(product.errors[:title]).to include(I18n.translate('errors.messages.taken'))
  end
end