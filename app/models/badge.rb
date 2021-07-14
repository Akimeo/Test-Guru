class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :image_name, presence: true
  validates :rule, presence: true
end
