FactoryBot.define do
  factory :event do
    id {1}
    title_id {1}
    spot_id {1}
  end

  factory :other_event, class: Event do
    id {2}
    title_id {2}
    spot_id{2}
  end

  factory :finished_event, class: Event do
    id {3}
    title_id {3}
    spot_id {1}
    finish_at { Date.new(2020, 01, 01) }
  end

  factory :related_event, class: Event do
    id {4}
    title_id {1}
    spot_id {3}
    finish_at { Date.new(2030, 01, 01) }
  end
end
  