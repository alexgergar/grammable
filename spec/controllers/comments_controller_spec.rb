require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on grams" do
      gram = FactoryBot.create(:gram)
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { gram_id: gram.id, comment: { message: 'awesome gram'}}
      expect(response).to redirect_to root_path
      expect(gram.comments.length).to eq 1
      expect(gram.comments.first.message).to eq "awesome gram"
    end

    it "should require that a user be logged in to comment on a gram" do
      gram = FactoryBot.create(:gram)
      post :create, params: { gram_id: gram.id, comment: { message: 'awesome gram'}}
      expect(response).to redirect_to new_user_session_path
    end

    it "should show a user a 404 Not found message when they create a comment for a gram with an invalid id" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { gram_id: 'badid', comment: { message: 'awesome gram'}}
      expect(response).to have_http_status :not_found
    end
  end

end
