ActiveAdmin.register Title do
  permit_params :name, :image, :time, :price, :url, :source, :note
end
