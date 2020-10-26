class User < ApplicationRecord
      # バリデーション
  # 保存前に全てを小文字変換
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  # 「password」と「password_confirmation」という項目をフォームで送るとbcryptが勝手に暗号化し
  # 「password_digest」というカラムに暗号化したデータを入れる
  # https://qiita.com/chobi9999/items/20b962a324a0bdbfc0dc

  has_secure_password

  has_many :users2s, dependent: :destroy

end
