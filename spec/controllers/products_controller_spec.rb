require 'rails_helper'

describe ProductsController, type: :controller do
  
  let!(:product) { Product.create!(name: "race bike") }
  let!(:product2) { Product.create!(name: "race bike") }
  let!(:product3) { Product.create!(name: "race bike") }
  let(:user) { User.create!(email: "santovaralstore@gmail.com", password: "password") }
  
  context 'User is admin' do
    let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }

    before do
      sign_in admin
    end

    describe 'GET #index' do 
      it 'returns all products' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:products).empty?).to be false 
      end
    end

    describe 'GET #new' do 
      it 'returns new product' do
        get :new
        expect(response).to have_http_status(200)
        expect(assigns(:product)).to_not be_nil
      end
    end

    describe 'POST #create' do 
      it 'creates new product' do
        post :create, params: { product: { name: 'product' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(assigns(:product)))
      end
    end

    describe 'PUT #update' do 
      it 'updates product' do
        put :update, params: { id: product.id, product: { name: 'some product' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(product))
        expect(assigns(:product)).to eq product
      end
    end

    describe 'GET #show' do 
      it 'return product' do
        get :show, params: { id: product.id }
        expect(assigns(:product)).to_not be_nil
        expect(assigns(:product)).to eq product
      end
    end

    describe 'DELETE #destroy' do 
      it 'destroys product' do
        delete :destroy, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(products_path)
      end
    end
  end
  
  context 'User is signed in' do
    before do
      sign_in user
    end

    describe 'GET #index' do 
      it 'returns all products' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:products).empty?).to be false 
      end
    end
    
    describe 'GET #new' do 
      it 'redirect to root_url' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'POST #create' do 
      it 'redirect to root_url' do
        post :create, params: { product: { first_name: '', last_name: '', email: '', password: '' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #edit' do 
      it 'redirect to root_url' do
        get :edit, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'PUT #update' do 
      it 'redirect to root_url' do
        put :update, params: { id: product.id, user: { first_name: 'Jhon' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #show' do 
      it 'redirect to root_url' do
        get :show, params: { id: product.id }
        expect(response).to have_http_status(200)
        expect(assigns(:product)).to eq product
      end
    end
    
    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end
  
  context 'User is not signed in' do
    describe 'GET #index' do 
      it 'returns all products' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:products).empty?).to be false 
      end
    end
    
    describe 'GET #new' do 
      it 'redirect to root_url' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'POST #create' do 
      it 'redirect to root_url' do
        post :create, params: { product: { first_name: '', last_name: '', email: '', password: '' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #edit' do 
      it 'redirect to root_url' do
        get :edit, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'PUT #update' do 
      it 'redirect to root_url' do
        put :update, params: { id: product.id, user: { first_name: 'Jhon' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #show' do 
      it 'redirect to root_url' do
        get :show, params: { id: product.id }
        expect(response).to have_http_status(200)
        expect(assigns(:product)).to eq product
      end
    end
    
    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end
end