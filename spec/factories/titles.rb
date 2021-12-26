FactoryBot.define do
  factory :title, class: Title do
    id { 1 }
    name { 'なぞとき' }
  end

  factory :other_title, class: Title do
    id { 2 }
    name { '脱出' }
  end

  factory :finished_title, class: Title do
    id { 3 }
    name { '宝探し' }
  end
end
