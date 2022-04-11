class Quiz < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :source
  has_one_attached :image

  validates :question, presence: { message: 'は必須項目です' }
  validates :card_name, presence: { message: 'は必須項目です' }
  validates :source_id, numericality: { other_than: 1 }
  validates :image, presence: { message: 'は必須項目です' }

  #  after_find :limit_to_time

  #    def limit_to_time
  #      self.number = Time.current.since(2.minute)
  #    end
end
