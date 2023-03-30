FactoryBot.define do
  factory :room do
    name            { 'サンプルルーム' }
    creator         { association :user }
    image           { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    user_ids        { [association(:user).id, association(:user).id, association(:user).id] }

    after(:build) do | room, evaluator |
      room.user_ids = evaluator.user_ids
    end
  end
end
