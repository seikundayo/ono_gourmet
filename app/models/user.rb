class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_topics, through: :likes, source: :topic
  has_many :follow_relationships, dependent: :destroy
  has_many :follow_shops, through: :follow_relationships, source: :admin
  validates :username, presence: true
  validates :sex, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :user_image, UserImageUploader
  enum sex: { man: 0, woman: 1}

# ユーザー編集の時にパスワードを入力せずに更新できる。
  def update_with_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)

    clean_up_passwords
    result
  end

end
