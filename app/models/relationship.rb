class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  def followed_by?(user)
    follower = passive_relationships.find_by(following_id: user.id)
    follower.present?
  end
end
