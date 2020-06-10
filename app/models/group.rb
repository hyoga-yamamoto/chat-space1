class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  # 多対多,を使用する時によく使われる記述です。
  has_many :messages
  validates :name, presence: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end