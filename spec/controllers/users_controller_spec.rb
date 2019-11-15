require 'rails_helper'

describe UsersController, type: :controller do

  describe 'POST #create signed as admin' do 
    let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }

    before do
      sign_in admin
    end
    
    context 'when a user have first_name last_name email and password' do 
      let(:user) { User.new(first_name: 'Peter', last_name: 'Example', email: 'peter@example.com', password: '1234567890') }

      it "creates an user and redirect to user view" do
        post :create, params: { user: { first_name: user.first_name, last_name: user.last_name, email: user.email, password: user.password } }
        expect(assigns(:user)).to_not be_nil
        expect(response).to redirect_to user_path(assigns(:user))
      end
      
    end
  end

  describe 'GET #show' do
    let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }

    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do  
      it 'redirects to main app root url' do
        get :show, params: { id: user.id }
        expect(response).to be_present # Be the same thing that expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end

  end
end