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
  validates :email, uniqueness_without_deleted: true

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

  # deviseの設定をオーバーライドして、emailのユニーク制約を外す
  def self.included(base)
    base.extend ClassMethods
    assert_validations_api!(base)

    base.class_eval do
      validates_presence_of   :email, if: :email_required?
      # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
      validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

      validates_presence_of     :password, if: :password_required?
      validates_confirmation_of :password, if: :password_required?
      validates_length_of       :password, within: password_length, allow_blank: true
    end
  end
end
