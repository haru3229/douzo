class Category < ActiveHash::Base
  self.data = [
    { id:  1, name: '--' },
    { id:  2, name: '服（制服・体操服・私服）' },
    { id:  3, name: '帽子（制帽・赤白帽など）' },
    { id:  4, name: '学習道具' },
    { id:  5, name: 'おもちゃ' },
    { id:  6, name: '本' },
    { id:  7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
