ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :category_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :image
    column :price
    actions
  end

  show do
    product
  end

  filter :title
  filter :price
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :description
      f.input :image
      f.input :price
    end
    f.actions
  end
end
