require "rails_helper"

RSpec.describe ChirpsController, type: :controller do
	
	let(:chirp) {
		FactoryGirl.build(:chirp)
	}

	let(:current_user) {
		{user_id: 1}
	}
	
	describe "GET #index" do
		it "assigns all chirps as @chirps" do
			chirp.save
			get :index
			expect(assigns(:chirps)).to eq [chirp]
		end	
	end

	describe "GET #new" do
		it "assigns all new chirp as @chirp" do
			FactoryGirl.create(:user)
			get :new, {chirp: FactoryGirl.attributes_for(:chirp)}, current_user
			expect(assigns(:chirp)).to be_a_new(Chirp)
		end	
	end	

	describe "POST #create" do
		context "create chirp with valid attributes" do

			it "creates a new chirp" do
				user = FactoryGirl.create(:user)
				expect {
					post :create, {post: attributes_for(:chirp)}, current_user
				}.to change(Chirp, :count).by(1)
			end
			
			xit "assigns a new chirp as at @chirp" do
				post :create, {chirp: attributes_for(:chirp)}
				expect(assigns(:chirp)).to eq chirp
			end

			it "redirects to the new chirp" do

			end

		context "chirp with invalid atrributes" do

			it "it assigns a new but unsaved chirp as @chirp" do

			end	

			it "re-renders the new chirp template" do

			end	
		end	
		end
	end	
		
end