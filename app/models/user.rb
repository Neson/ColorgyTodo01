class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :timeoutable,
         :omniauthable, :omniauth_providers => [:colorgy]

  has_many :todos

  def self.from_colorgy(auth, signed_in_resource=nil)
    user = where(:uuid => auth.info.uuid).first_or_create! do |user|
      user.email = auth.info.email
    end

    return user
  end
end
