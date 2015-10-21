FactoryGirl.define do

	factory :user do
		username "John123"
		password "1234"
		password_confirmation "1234"
	 	email "John123@nycda.com"
		location "New York"
		bio "Student"
	end	

end	
