require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new users template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
   context 'with invalid params' do
     it 'validates the presence of the user\'s username and password' do
       post :create, params: { user: { username: 'jack_bruce', password: '' } }
       expect(response).to render_template('new')
       expect(flash[:errors]).to be_present
     end

     it 'validates that the password is at least 6 characters long' do
       post :create, params: { user: { username: 'jack_bruce', password: 'short' } }
       expect(response).to render_template('new')
       expect(flash[:errors]).to be_present
     end
   end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end

end
