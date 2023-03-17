FactoryBot.define do
  factory :user do
    last_name              { '佐藤' }
    first_name             { '太郎' }
    email                 { 'test@example.com' }
    password              { 'nb0000' }
    password_confirmation { password }
    job_id                { '2' }
    hobby                 { '釣り' }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    context               { '宜しくお願いします。' }
    trait :with_context do
      context { ' 宜しくお願いします。' }
    end

    factory :user_with_context, traits: [:with_context]
  end
end
