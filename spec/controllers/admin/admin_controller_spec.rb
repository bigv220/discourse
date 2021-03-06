require 'spec_helper'

describe Admin::AdminController do

  context 'index' do

    it 'needs you to be logged in' do
      lambda { xhr :get, :index }.should raise_error(Discourse::NotLoggedIn)
    end

    it "raises an error if you aren't an admin" do
      user = log_in
      xhr :get, :index
      response.should be_forbidden
    end

  end


end
