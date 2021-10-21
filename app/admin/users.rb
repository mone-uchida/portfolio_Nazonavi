ActiveAdmin.register User do
  permit_params :name, :email, :password, :profile, :icon
end
