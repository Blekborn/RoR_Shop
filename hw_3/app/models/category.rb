class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  has_ancestry

  def to_param
    "#{id}-#{name.parameterize.downcase}"
  end

end
