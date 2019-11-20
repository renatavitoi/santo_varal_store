require 'rails_helper'

describe UsersController, type: :controller do
  
  describe 'User default signed in' do
    let(:userdefault) { FactoryBot.create(:user) }

    before do
      sign_in userdefault
    end

    describe 'GET #index' do 
      it 'redirect to root_url' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
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
        post :create, params: { user: { first_name: '', last_name: '', email: '', password: '' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'GET #edit' do 
      it 'redirect to edit_user' do
        get :edit, params: { id: userdefault.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(edit_user_registration_path)
      end
    end

    describe 'PUT #update' do 
      it 'return user' do
        put :update, params: { id: userdefault.id, user: { first_name: 'Jhon' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_path(userdefault))
      end
    end

    describe 'GET #show' do 
      it 'returns user' do
        get :show, params: { id: userdefault.id }
        expect(assigns(:user)).to_not be_nil
        expect(assigns(:user)).to eq userdefault
      end
    end

    describe 'DELETE #destroy' do 
      it 'redirect to root_url' do
        delete :destroy, params: { id: userdefault.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'User signed out' do
    let(:userdefault) { FactoryBot.create(:user) }
    
    describe 'GET #index' do 
      it 'redirect to root url' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'GET #new' do 
      it 'redirect to signin' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST #create' do 
      it 'redirect to signin' do
        post :create, params: { user: { first_name: '', last_name: '', email: '', password: '' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do 
      it 'redirect to signin' do
        get :edit, params: { id: userdefault.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PUT #update' do 
      it 'redirect to signin' do
        put :update, params: { id: userdefault.id, user: { first_name: 'Jhon' } }
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET #show' do 
      it 'redirect to root_url' do
        get :show, params: { id: userdefault.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'DELETE #destroy' do 
      it 'redirect to signin' do
        delete :destroy, params: { id: userdefault.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'User admin signed in' do
    let(:admin) { User.create!(email: 'admin@example.com', password: '1234567890', admin: true) }

    before do
      sign_in admin
    end

    describe 'GET #index' do 
      it 'returns all users' do
        get :index
        expect(response).to have_http_status(200)
        expect(assigns(:users).empty?).to be false 
      end
    end

    describe 'GET #new' do 
      it 'returns new user' do
        get :new
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to_not be_nil
      end
    end

    describe 'POST #create' do 
      it 'creates new user' do
        post :create, params: { user: { first_name: 'jhon', last_name: 'due', email: 'jhon@example.com', password: 'password' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_path(assigns(:user)))
      end
    end

    describe 'GET #edit' do 
      it 'redirects to registration_path' do
        get :edit, params: { id: admin.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(edit_user_registration_path)
      end
    end

    describe 'PUT #update' do 
      it 'updates user' do
        put :update, params: { id: admin.id, user: { first_name: 'james' } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_path(admin))
        expect(assigns(:user)).to eq admin
      end
    end

    describe 'GET #show' do 
      it 'return user' do
        get :show, params: { id: admin.id }
        expect(assigns(:user)).to_not be_nil
        expect(assigns(:user)).to eq admin
      end
    end

    describe 'DELETE #destroy' do 
      it 'destroys user' do
        delete :destroy, params: { id: admin.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(users_path)
      end
    end
  end
end