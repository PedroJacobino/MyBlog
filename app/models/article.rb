class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, uniqueness: true, presence: true,
                    length: { minimum: 5}
end
