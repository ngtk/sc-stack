require 'rails_helper'

describe HomeController, type: :controller do
  describe "GET #show" do
    subject { get :show }
    it { is_expected.to be_success }
  end
end
