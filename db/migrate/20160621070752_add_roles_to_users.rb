class AddRolesToUsers < ActiveRecord::Migration
  def change
    # using postgres array so we can apply multiple roles to a user.
    # kevin.roles => ['user', 'admin']
    # becky_anne.roles => ['user', 'student']
    add_column :users, :roles, :string, array: true, default: '{}'
    add_index  :users, :roles, using: 'gin'
  end
end
