class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  ### Associations
  has_many :company_memberships
  has_many :companies, :through => :company_memberships
  has_many :rooms, :through => :companies

  ### Attributes
  attr_accessor :user_company
  attr_accessible :user_company

  ### Validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_presence_of :user_company, :on => :create

  ### Callbacks
  after_create :create_company

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :username

  def available_rooms
    companies.map { |c| c.rooms }.flatten
  end

  def current_company
    self.companies.find(current_company_id) if current_company_id
  end

  private

  def create_company
    company = Company.create!(name: self.user_company)
    CompanyMembership.create!(user: self, company: company)
    self.current_company_id = company.id
    self.save
  end
end
