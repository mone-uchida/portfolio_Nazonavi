ActiveAdmin.register Spot do
  permit_params :name, :address, :lat, :lng, :url
end
