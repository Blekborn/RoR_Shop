class Product < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :line_items
  mount_uploader :image, ImageUploader

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, presence: true
  validates :price, numericality: { greater_thn_or_equal_to: 0.01 }
  validates :title, uniqueness: true

  # default_scope -> { order(created_at: :desc) }

  def to_param
    "#{id}-#{title.parameterize.downcase}"
  end

  def rating
    return 0 if comments.empty?

    comments.sum(&:rating).to_f / comments.count
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'there are commodity items')
      false
    end
  end
end
