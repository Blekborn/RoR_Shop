class Product < ApplicationRecord
  belongs_to :category
  validates :title, :description, presence: true
  validates :price, numericality: { greater_thn_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  # default_scope -> { order(created_at: :desc) }


  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: %r{\Aimage/.*\z}

  def to_param
    "#{id}-#{title.parameterize.downcase}"
  end
end
