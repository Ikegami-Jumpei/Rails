class Topic < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :image_size, presence: true

  private

  #アップロードされた画像サイズをバリデーションする
  def image_size
      if picturez_size > 10.megabytes
          errors.add(:picture, "10MB以下にしてください。")
      end
    end
end
