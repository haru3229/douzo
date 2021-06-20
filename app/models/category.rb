class Category < ActiveHash::Base
  self.data = [
    { id:  1, name: '--' },
    { id:  2, name: '制服・体操服・私服' },
    { id:  3, name: '制帽・赤白帽' },
    { id:  4, name: '学習道具' },
    { id:  5, name: 'おもちゃ・ゲーム' },
    { id:  6, name: '本' },
    { id:  7, name: '' },
    { id:  8, name: '' },
    { id:  9, name: '' },
    { id: 10, name: '' },
    { id: 11, name: '' }
  ]

  include ActiveHash::Associations
  has_many :items
end
