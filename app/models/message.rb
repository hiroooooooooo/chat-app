class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  # 画像の有無によって、バリデーションを行うか条件分岐
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
