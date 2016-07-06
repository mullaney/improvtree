class User < ActiveRecord::Base
  VALID_ROLES = %w(admin user)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def roles=(nominated_roles)
    # `&` is a set intersection in Ruby
    # Only roles that exist in `nominated_roles` and `VALID_ROLES` will be set.
    super nominated_roles & VALID_ROLES
  end

  def admin?
    roles.include?('admin')
  end

  def student
    @student ||= Student.find_or_create_by user_id: self.id
  end
end
