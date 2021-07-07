require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { User.create!(email: "santovaralstore@gmail.com", password: "password") }
  let!(:product) { Product.create!(name: "product", colour: "white", price: 2, description: "awesome bike") }
  let!(:comment) { Comment.create!(body: "comment", user: user, product: product, rating: 2) }
  
  context 'User is admin' do
    let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }

    before do
      sign_in admin
    end

    describe 'POST #create' do 
      it 'create comment' do
        post :create, params: { product_id: product.id, comment: { body: 'comment', user: user } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(assigns(:product)))
      end
    end

    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { product_id: product.id, id: comment.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(product))
      end
    end
  end
  
  context 'User is signed in' do
    before do
      sign_in user
    end

    describe 'POST #create' do 
      it 'create comment' do
        post :create, params: { product_id: product.id, comment: { body: 'comment', user: user } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(assigns(:product)))
      end
    end
    
    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { product_id: product.id, id: comment.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end
  
  context 'User is not signed in' do
    describe 'POST #create' do 
      it 'create comment' do
        post :create, params: { product_id: product.id, comment: { body: 'comment', user: user } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(assigns(:product)))
      end
    end
    
    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { product_id: product.id, id: comment.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end
end