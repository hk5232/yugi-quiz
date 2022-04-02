class Quiz < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :source
  has_one_attached :image

  validates :question, presence: { message: 'は必須項目です' }
  validates :card_name, presence: { message: 'は必須項目です' }
  validates :source_id, numericality: { other_than: 1 } 
  validates :attack, format: { with: /\A[0-9]+\z/ }
  validates :defense, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: { message: 'は必須項目です' }
  
end
