class User
  include Mongoid::Document
#  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  field :remember_created_at, :type => Time

  field :role, :type => Integer
  
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
  # field :authentication_token, :type => String
  field :name, :type => String, :default => "Undefined"
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  field :admin, :type => Boolean, :default => false
  def admin?
    admin=="true"
  end
  def copywriter?
    role==0
  end
end
