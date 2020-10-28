class Admin < ApplicationRecord
  has_many :admin_likes, dependent: :destroy
  has_many :amin_liked_topics, through: :likes, source: :topic
  has_many :follow_relationships, dependent: :destroy
  has_many :follow_user, through: :follow_relationships, source: :user
  has_many :manager_topics 
  belongs_to :shop
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :admin_name, presence: true
  mount_uploader :admin_image, AdminImageUploader


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
