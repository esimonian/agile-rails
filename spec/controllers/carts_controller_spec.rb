require 'rails_helper'

describe CartsController do
  before :each do 
    @cart  = create(:cart)
  end

  describe 'GET #index' do
    it 'gets index' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new cart to @cart" do
      get :new
      expect(assigns(:cart)).to be_a_new(Cart)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "assigns the requested cart to @cart" do
      get :show, params: { id: @cart }
      expect(assigns(:cart)).to eq @cart
    end

    it "renders the :show template" do
      get :show, params: { id: @cart }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "assigns the requested cart to @cart" do
      get :edit, params: { id: @cart }
      expect(assigns(:cart)).to eq @cart
    end

    it "renders the :edit template" do
      get :edit, params: { id: @cart }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    it "saves the new cart in the database" do
      expect{
        post :create, params: { id: @cart }
      }.to change(Cart, :count).by(1)
    end
    it "re-renders the :new template" do
      post :create, params: { id: @cart }
      expect(response).to redirect_to Cart.last
    end
  end

  describe 'DELETE #destroy' do

    it "deletes the cart" do
      post :create, id: create(:line_item)
      @cart = Cart.find(session[:cart_id])
      expect{
        delete :destroy, params: { id: @cart }
      }.to change(Cart,:count).by(-1)
    end

    it "redirects to carts#index" do
      delete :destroy, params: { id: @cart }
      expect(response).to redirect_to store_index_url
    end
  end

end