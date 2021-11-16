FactoryBot.define do
  factory :spot, class: Spot do
    id {1}
    place {"イベント会場"}
    address {"東京都"}
    lat {100.000000}
    lng {100.000000}
  end

  factory :other_spot, class: Spot do
    id {2}
    place {"遊園地"}
    address {"大阪府"}
    lat {100.000000}
    lng {50.000000}
  end

  factory :related_spot, class: Spot do
    id {3}
    place {"動物園"}
    address {"北海道"}
    lat {100.000000}
    lng {110.000000}
  end
end
    