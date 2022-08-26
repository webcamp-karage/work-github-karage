class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses
  has_many :cart_items, dependent: :destroy
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :first_name_kana,presence:true
  validates :last_name_kana,presence:true
  validates :postal_code,presence:true,length: { is: 7 }
  # ７桁のバリデーションがかかって保存されない

  def full_address
    '〒'+postal_code+' '+address
  end

  def self.search(search,word)
    if search == "forward"
      @customers = Customer.where("first_name LIKE?","#{word}%")
    elsif search =="partial"
      @customers = Customer.where("first_name LIKE?","%#{word}%")
    else
      @customers = Customer.all
    end
  end

end
