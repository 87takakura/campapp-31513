class Watersupply < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ζ' },
    { id: 3, name: 'η‘' },
    { id: 4, name: 'δΈζ' }
  ]

  include ActiveHash::Associations
  has_many :campposts
end
