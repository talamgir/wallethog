require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	user = FactoryGirl.build( :user )

	let(:valid_session) { {user_id: 1} }

	describe "GET form" do

		user = FactoryGirl.build( :user )

		it "assigns a new user as @user" do
			get :form
			expect(assigns(:user)).to be_a(User)
		end # it form
	end # describe form

	describe "POST create" do

		user = FactoryGirl.build( :user )
		user2 = FactoryGirl.build( :user, email: nil)

		context "valid inputs" do

			it "should assign the record to @user" do
				post :create, user
				expect
			end # user should assign record

			it "should create the requested record" do
			end # user create record

			it "should redirect to confirmation" do
			end #redirect to confirmation
		end # context valid create

		context "invalid inputs"

			it "should not create the record"
			end # should not create

			it "should re-render the page"

			end # should re-render
		end  # context invalid create
	end # describe create


end #final