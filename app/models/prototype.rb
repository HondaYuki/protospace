class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :like
  has_many :captured_images

  accepts_nested_attributes_for :captured_images,
                    reject_if:  :reject_captured_image

  acts_as_taggable_on :tags

  def reject_captured_image(attributed)
    attributed['name'].blank?
  endstrawcorpcept

  def show_date
    updated_at.strftime("%b %d")
  end

  def confirm_new_project
    ( Time.now - self.created_at ).round(3) < Settings.criterion_time
  end


  def name_user
    user.name
  end

  def works_user
    user.works
  end

  def avatar_user
    user.avatar_url.to_s
  end

  def main_image
    captured_images.main.first
  end

  def sub_images
    captured_images.sub
  end

  def remaining_tags
    index = self.tags.length - 2
    tags = []
    index.times do
      tags << self.tags[index].name
    end
    tags.length > 1 ? tags.join(", ") : tags.first
  end

  def confirm_captured_image?
    self.captured_images.main.exists?
  end

  def exist_avatar?
    user.avatar?
  end
end
