class Post < ApplicationRecord
  validates :titulo, presence: true, length: {minimum: 3, maximum: 50}
  validates :descripcion, presence: true, length: {minimum: 10, maximum: 300}
end