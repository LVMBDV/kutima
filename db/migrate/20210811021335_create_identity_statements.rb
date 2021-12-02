# frozen_string_literal: true

class CreateIdentityStatements < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL.squish
      CREATE TYPE life_area AS ENUM ('career', 'financial', 'spiritual', 'physical', 'intellectual', 'family', 'social');
    SQL

    create_table :identity_statements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :identity
      t.string :objective

      t.timestamps
    end

    add_column :identity_statements, :life_area, :life_area
    add_index :identity_statements, :life_area
  end

  def down
    drop_table :identity_statements
    execute <<-SQL.squish
      DROP TYPE life_area;
    SQL
  end
end
