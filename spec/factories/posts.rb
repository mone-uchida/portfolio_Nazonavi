FactoryBot.define do
  factory :post, class: Post do
    user_id { 1 }
    title_id { 1 }
    content { '楽しかった！' }
  end
  factory :other_post, class: Post do
    user_id { 2 }
    title_id { 2 }
    content { '脱出できた！' }
  end
end
