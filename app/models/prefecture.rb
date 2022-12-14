class Prefecture < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, { id: 1, name: '福岡県' }, { id: 2, name: '佐賀県' },
    { id: 3, name: '長崎県' }, { id: 4, name: '熊本県' }, { id: 5, name: '大分県' },
    { id: 6, name: '山口県' }
  ]
  include ActiveHash::Associations
  has_many :locations
end
