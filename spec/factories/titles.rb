FactoryBot.define do
  factory :title, class: Title do
    id { 1 }
    name { 'なぞとき' }
    image { 'default_event_image.jpg' }
  end

  factory :other_title, class: Title do
    id { 2 }
    name { '脱出' }
    image { 'default_event_image.jpg' }
  end

  factory :finished_title, class: Title do
    id { 3 }
    name { '宝探し' }
    image { 'default_event_image.jpg' }
  end
end
