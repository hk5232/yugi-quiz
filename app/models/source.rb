class Source < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'モンスター' }, { id: 3, name: '魔法' },
    { id: 4, name: '罠' }
  ]

  include ActiveHash::Associations
  has_many :quizzes
end
