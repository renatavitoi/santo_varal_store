require 'rails_helper'

describe OrdersController, type: :controller do
  let!(:product) { Product.create!(name: "race bike", colour: "white", price: 200, description: "awesome bike") }
  let(:user) { User.create!(email: "santovaralstore@gmail.com", password: "password") }
  let!(:order) { Order.create!(user: user, product: product) }

  describe 'User is admin' do
    let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }
    let!(:orderadmin) { Order.create!(user: admin, product: product) }
    
    before do
      sign_in admin
    end
    
    describe 'GET #index' do 
      it 'returns all orders' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:orders).empty?).to be false 
      end
    end
    
    describe 'GET #show' do 
      it 'return order' do
        get :show, params: { id: admin.id }
        expect(assigns(:order)).to_not be_nil
        expect(assigns(:order)).to eq orderadmin
      end
    end
  end

  describe 'User is signed in' do

    before do
      sign_in user
    end
    
    describe 'GET #index' do 
      it 'returns all orders' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:orders).empty?).to be false 
      end
    end
    
    describe 'GET #show' do 
      it 'returns order' do
        get :show, params: { id: order.id }
        expect(assigns(:order)).to_not be_nil
        expect(assigns(:order)).to eq order
      end
    end
  end
  
  describe 'User is not signed in' do  
    describe 'GET #index' do 
      it 'redirect to signin' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe 'GET #show' do 
      it 'redirect to signin' do
        get :show, params: { id: order.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end
end