class Job < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '医師' },
    { id: 3, name: '看護師' },
    { id: 4, name: '理学療法士' },
    { id: 5, name: '作業療法士' },
    { id: 6, name: '言語聴覚士' },
    { id: 7, name: '薬剤師' },
    { id: 8, name: '介護支援専門員' },
    { id: 9, name: '訪問介護士' },
    { id: 10, name: '福祉用具相談員' },
    { id: 11, name: '義肢装具士' },
    { id: 12, name: '通所スタッフ' },
    { id: 13, name: 'その他' }
  ]
end
