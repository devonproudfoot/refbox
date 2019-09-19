class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :requests

  AFFILIATIONS = ['None', 'Student', 'Staff', 'Faculty', 'Alumni' ]

  def self.export_users(parameter=nil)
    header = ['id', 'email']
    rows = []

    all.each do |user|
      rows<<[user.id, user.email]
    end

    ApplicationRecord.create_csv(header, rows)
  end

end
