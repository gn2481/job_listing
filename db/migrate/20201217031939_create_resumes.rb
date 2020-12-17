class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.references :job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :cover_letter
      t.string :attachment

      t.timestamps
    end
  end
end
