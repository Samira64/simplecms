class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
        t.column "name", :string
        t.column "position", :integer
        t.column "visible", :boolean, :default => false

      t.timestamps
    end
  end
end
