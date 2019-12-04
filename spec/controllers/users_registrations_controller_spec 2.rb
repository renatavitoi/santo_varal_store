require 'rails_helper'

describe UserRegistrationsController , type: :controller do
  
  context 'registration with all infos required' do 
    let(:user) { User.new(email: 'user@example.com', password: 'password') }

    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end
    
    context 'post #create' do
      it 'creates user' do
        post :create, params: { user: {email: user.email, password: user.password } } 
        expect(assigns(:user)).to_not be_nil 
      end
    end
  end
end