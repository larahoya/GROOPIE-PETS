class AddAvatarColumnsToPets < ActiveRecord::Migration
  def up
    add_attachment :pets, :avatar
  end

  def down
    remove_attachment :pets, :avatar
  end
end
