FactoryBot.define do
  factory :event do
    name            { 'テストイベント' }
    text            { '宜しくお願いします。' }
    place           { '自宅' }
    start_time      { Time.current + 1.hour }
    end_time        { Time.current + 2.hour }

    association :user
    association :room
    association :organizer, factory: :user
  end
end
