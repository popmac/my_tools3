class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
        :validatable, :authentication_keys => [:login]
  has_one :profile, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }, format: { with: /\A[a-z0-9_]+\z/i }

  acts_as_paranoid

  before_create :build_default_profile

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  private
  def build_default_profile
    build_profile
    true
  end
end
