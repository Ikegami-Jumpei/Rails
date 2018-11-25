class Topic < ApplicationRecord

  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  # validate  :picture_size

  belongs_to :user

  mount_uploader :image, ImageUploader

  private

  #アップロードされた画像サイズをバリデーションする
  # def picture_size
  #   if picture.size > 10.megabytes
  #     errors.add(:picture, "should be less than 10MB")
  #   end
  # end
end
