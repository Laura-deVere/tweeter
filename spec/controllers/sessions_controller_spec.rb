require 'rails_helper'
RSpec.describe SessionsController, type: :controller do

	let(:valid_params) {
		@valid_params = {
			username: "John123",
			password: "1234",
			password_confirmation: "1234",
			email: "John123@nycda.com"
		}
	}

	let(:valid_login) {
		@valid_login = {
			email: "John123@nycda.com",
			password: "1234"
		}
	}

	let(:invalid_login) {
		@invalid_login = {
			password: nil
		}
	}

	describe "POST #create" do
		context "valid login" do
			it "to save user as @user" do 
				user = User.create! valid_params
				post :create, valid_login
				expect(assigns(:user)).to eq user
			end

			it "redirect the user to user path" do
				user = User.create! valid_params
				post :create, valid_login
				expect(response).to redirect_to chirps_path
			end	
		end	

		context "invalid login" do
			it "redirects user to 'new' template" do
				user = User.create! valid_params
				post :create, invalid_login
				expect(response).to redirect_to login_path
			end	
		end	

		describe "DELETE #destroy" do 
			it "destroy the user session and redirects to chirps path" do
				user = User.create! valid_params
				delete :destroy, valid_login
				expect(response).to redirect_to chirps_path
			end
		end	
	end
end