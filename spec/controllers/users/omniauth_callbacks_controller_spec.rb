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
          },
          'credentials' =>
          {
            'token' => 'ythg32hwi55gh36qvuhbat4wu8e'
          }
        }
      OmniAuth::AuthHash.new(hash)
    end

    context 'SoundCloudで初めてのログインの場合' do
      it 'Userが作成される' do
        expect { subject }.to change { User.count }.by(1)

        user = User.last
        expect(user.name).to eq 'MarkZak'
        expect(user.email).to be_blank
        expect(user.provider).to eq 'soundcloud'
        expect(user.token).to eq 'ythg32hwi55gh36qvuhbat4wu8e'
        expect(user.uid).to eq '1349781'
      end
    end

    context 'すでにSoundCloudでサインアップ済みの場合' do
      let!(:user) { create :user, :with_soundcloud, uid: '1349781' }

      it 'Userは作成されない' do
        expect { subject }.not_to change { User.count }
      end
    end
  end
end
