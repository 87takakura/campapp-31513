class Outlet < ActiveHash::Base
self.data = [
  { id: 1, name: '--' },
  { id: 2, name: '有' },
  { id: 3, name: '無' },
  { id: 4, name: '不明' }
]

include ActiveHash::Associations
has_many :campposts
end
