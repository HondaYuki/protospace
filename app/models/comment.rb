class Comment < ActiveRecord::Base
  belongs_to :prototype, counter_cache: true
  belongs_to :user

  def name_user
    user.name
  end

  def avatar_user
    user.avatar_url.to_s
  end

  def count_comments
    prototype.comments_count
  end

  def exist_avatar?
    user.avatar?
  end
end
