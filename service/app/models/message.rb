class Message < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :text, length: { maximum: 100 }
end
