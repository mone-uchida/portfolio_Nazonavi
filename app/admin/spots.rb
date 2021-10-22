ActiveAdmin.register Spot do
  permit_params :place, :address, :lat, :lng, :url
end
