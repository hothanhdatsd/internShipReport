class Post < ApplicationRecord
  enum status: [:active, :published]
  belongs_to :user
  scope :active, -> {where(status:"active")}
  scope :published, -> {where(status:"published")}
  scope :getPost, ->(title) { where("title = ?", title) }
end
