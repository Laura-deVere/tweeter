require 'rails_helper'
RSpec.describe UsersController, type: :controller do
	
	let(:valid_attributes) {
		@valid_attributes = {
			username: "John123",
			password: "1234",
			password_confirmation: "1234",
			email: "John123@nycda.com",
			location: "New York",
			bio: "Student"
		}
	}

	let(:invalid_attributes) {
		@invalid_attributes = {
			email: nil
		}
	}

	let(:valid_session) {
		{user_id: 1}
	}

	describe "GET #index" do
		it "assigns all users as @users" do
			user = User.create! valid_attributes
			get :index
			expect(assigns(:users)).to eq [user]
		end
	end	

	describe "GET #show" do
		it "assigns the requested user as @user" do
			user = User.create! valid_attributes
			get :show, {id: user.to_param}
			expect(assigns(:user)).to eq user
		end
	end	

	describe "GET #new" do
		it "assigns a new user as @user" do
			get :new, {}, valid_session
			expect(assigns(:user)).to be_a_new(User)
		end	
	end	

	describe "GET #edit" do
		it "assigns the current user to be @user " do
			user = User.create! valid_attributes
			get :edit, {id: user.to_param}, valid_session
			expect(assigns(:user)).to eq user
		end	
	end	

	describe "POST #create" do
		context "create user with valid params" do
			it "create a new user" do
				expect {
					post :create, {user: valid_attributes}, valid_session
				}.to change(User, :count).by(1)
			end

			it "assigns a new user as @user with valid session" do
				post :create, {user: valid_attributes}, valid_session
				expect(assigns(:user)).to be_a(User)
				expect(assigns(:user)). to be_persisted
			end

			it "redirects to the the user profile" do
				post :create, {user: valid_attributes}, valid_session
				expect(response).to redirect_to(User.last)
			end	
		end

		context "create user with invalid params" do
			it "it assigns newly created user but unsaved user as @user" do 
				post :create, {user: invalid_attributes}, valid_session
				expect(assigns(:user)).to be_a_new(User)
			end	

			it "re-renders the 'new' template" do
				post :create, {user: invalid_attributes}, valid_session
				expect(response).to render_template('new')
			end	
		end	

		describe "PUT #update" do 
			context "with valid params" do
				let(:new_attributes) {
					@new_attributes = {
						username: "John1234",
						location: "Queens"
					}
				}

				it " updates the requested user" do 
					user = User.create! valid_attributes
					put :update, {id: user.to_param, user: new_attributes}, valid_session
						user.reload
						expect(user.username).to eq "John1234"
				end
				
				it "assigns the requested user as @user" do
					user = User.create! valid_attributes
					put :update, {id: user.to_param, user: new_attributes}, valid_session
					expect(assigns(:user)).to eq user
				end

				it "redirects to the user" do 
					user = User.create! valid_attributes
					put :update, {id: user.to_param, user: new_attributes}, valid_session
					expect(response).to redirect_to(User.last)
				end
			end

			context "with invalid params" do
				it "assigns the user as @user" do 
					user = User.create! valid_attributes
					put :update, {id: user.to_param, user: invalid_attributes}, valid_session
					expect(assigns(:user)).to eq user
				end
				
				it "re-renders the 'edit' template" do
					user = User.create! valid_attributes
					put :update, {id: user.to_param, user: invalid_attributes}, valid_session
					expect(response).to render_template('edit')
				end	
			end	
		end	

		describe "DELETE #destroy" do
			it "destroy the requested" do
				user = User.create! valid_attributes
				expect {
					delete :destroy, {id: user.to_param}, valid_session
				}.to change(User, :count).by(-1)
			end
			
			it "redirects to the users index" do
				user = User.create! valid_attributes
				delete :destroy, {id: user.to_param}, valid_session
				expect(response).to redirect_to(users_path)
			end	
		end	
	end	
end