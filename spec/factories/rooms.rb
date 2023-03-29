FactoryBot.define do
  factory :room do
    name            { 'サンプルルーム' }
    creator         { 'create(:user)' }
    image           { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    association :user
  end
end
