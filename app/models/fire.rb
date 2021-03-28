class Fire < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '可' },
    { id: 3, name: '不可' },
    { id: 4, name: '不明' }
  ]
  
  include ActiveHash::Associations
  has_many :campposts
  end
  