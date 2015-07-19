require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do
  describe 'GET #soundcloud' do
    subject { get :soundcloud }

    before { request.env['omniauth.auth'] = auth_hash }

    let(:auth_hash) do
      hash =
        {
          'provider' => 'soundcloud',
          'uid' => '1349781',
          'info' =>
          {
            'name' => 'MarkZak'
          }
        }
      OmniAuth::AuthHash.new(hash)
    end

    it 'Userが作成される' do
      expect { subject }.to change { User.count }.by(1)
      user = User.last
      expect(user.name).to eq 'MarkZak'
      expect(user.email).to be_blank
      expect(user.provider).to eq 'soundcloud'
      expect(user.uid).to eq '1349781'
    end
  end
end
