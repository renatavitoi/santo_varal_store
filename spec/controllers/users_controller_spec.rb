require 'rails_helper'

describe UsersController, type: :controller do
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
        expect(response).to redirect_to(root_url)
      end
    end

  end
end