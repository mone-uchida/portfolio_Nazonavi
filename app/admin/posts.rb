ActiveAdmin.register Post do
  permit_params :title_id, :user_id, :content
end
