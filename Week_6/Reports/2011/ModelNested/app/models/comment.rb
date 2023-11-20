class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :comment_count, dependent: :destroy
end
