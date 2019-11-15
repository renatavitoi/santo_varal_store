require 'rails_helper'

describe UsersController, type: :controller do
  
  describe 'User default signed in' do
    let(:userdefault) { User.create!(email: 'admin@example.com', password: '1234567890') }

    before do
      sign_in userdefault
    end

    it 'GET #index' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it 'GET #new' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it 'POST #create' do
      post :create, params: { user: { first_name: '', last_name: '', email: '', password: '' } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it 'GET #edit' do
      get :edit, params: { id: userdefault.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(edit_user_registration_path)
    end

    it 'PUT #update' do
      put :update, params: { id: userdefault.id, user: { first_name: 'Jhon' } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_path(userdefault))
    end

    it 'GET #show' do
      get :show, params: { id: userdefault.id }
      expect(assigns(:user)).to_not be_nil
      expect(assigns(:user)).to eq userdefault
    end

    it 'DELETE #destroy' do
      delete :destroy, params: { id: userdefault.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'User signed out' do
    let(:userdefault) { User.create!(email: 'admin@example.com', password: '1234567890') }
    
    it 'GET #index' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it 'GET #new' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'POST #create' do
      post :create, params: { user: { first_name: '', last_name: '', email: '', password: '' } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'GET #edit' do
      get :edit, params: { id: userdefault.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'PUT #update' do
      put :update, params: { id: userdefault.id, user: { first_name: 'Jhon' } }
      expect(response).to have_http_status(302)
    end

    it 'GET #show' do
      get :show, params: { id: userdefault.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it 'DELETE #destroy' do
      delete :destroy, params: { id: userdefault.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  # describe 'User admin signed in' do
  #   let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890') }

  #   before do
  #     sign_in admin
  #   end

  #   context '' do
  #     it '' do
        
  #     end
  #   end
  # end
  
  # describe 'GET #index' do
  #   let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890') }

  #   before do
  #     sign_in admin
  #   end

  #   context 'all' do
  #     it 'returns all users' do
  #       get :index
  #       puts response.body.inspect
  #     end
  #   end
  # end

  # describe 'POST #create signed as admin' do 
  #   let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }

  #   before do
  #     sign_in admin
  #   end
    
  #   context 'when a user have first_name last_name email and password' do 
  #     let(:user) { User.new(first_name: 'Peter', last_name: 'Example', email: 'peter@example.com', password: '1234567890') }

  #     it "creates an user and redirect to user view" do
  #       post :create, params: { user: { first_name: user.first_name, last_name: user.last_name, email: user.email, password: user.password } }
  #       expect(assigns(:user)).to_not be_nil
  #       expect(response).to redirect_to user_path(assigns(:user))
  #     end
      
  #   end
  # end

  # describe 'GET #show' do
  #   let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }

  #   context 'when a user is logged in' do
  #     before do
  #       sign_in user
  #     end

  #     it "loads correct user details" do
  #       get :show, params: { id: user.id }
  #       expect(response).to be_ok
  #       expect(assigns(:user)).to eq user
  #     end
  #   end

  #   context 'when a user is not logged in' do  
  #     it 'redirects to main app root url' do
  #       get :show, params: { id: user.id }
  #       expect(response).to be_present # Be the same thing that expect(response).to have_http_status(302)
  #       expect(response).to redirect_to(root_url)
  #     end
  #   end

  # end
end