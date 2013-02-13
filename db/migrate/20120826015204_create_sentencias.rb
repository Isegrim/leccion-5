class CreateSentencias < ActiveRecord::Migration
  def change
    create_table :sentencias do |t|
      t.string :palabras

      t.timestamps
    end
  end
end
