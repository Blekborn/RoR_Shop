ActiveAdmin.register Category do
  permit_params :name, :parent_id

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  show do
    category
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :parent_id
    end
    f.actions
  end
end
