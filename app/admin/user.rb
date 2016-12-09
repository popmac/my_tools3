ActiveAdmin.register User do

  permit_params :username, :email, :password

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
    end
    f.actions
  end

end
