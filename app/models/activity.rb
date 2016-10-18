class Activity < ApplicationRecord
  belongs_to :tagger, class_name: User.name
  belongs_to :user
  belongs_to :activable, polymorphic: true, optional: true

  scope :my_activity, -> user_id{
    where("activities.tag_user_id = ?", user_id)}

  scope :notification_activities, -> user_id{
    where("activities.tag_user_id = ?
    AND activities.seen = ?", user_id, 0)}
end
