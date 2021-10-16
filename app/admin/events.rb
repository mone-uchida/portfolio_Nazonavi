ActiveAdmin.register Event do
  permit_params :spot_id, :title_id, :start_at, :finish_at 
end
