class CapturedImage < ActiveRecord::Base

   belongs_to :prototype

  # carrierwave
  mount_uploader :name, CapturedImageUploader

  enum status: [:main, :sub]
end
