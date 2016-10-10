class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :parent_comment, class_name: Comment.name

  has_many :sub_comments, class_name: Comment.name,
    foreign_key: "parent_comment_id"
  has_many :activities, as: :activable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
