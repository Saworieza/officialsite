class CreateJoinTableMembersUserGroups < ActiveRecord::Migration
  def change
		create_join_table :members, :user_groups
  end
end
