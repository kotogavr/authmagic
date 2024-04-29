# frozen_string_literal: true

class CreateSignInTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :sign_in_tokens do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
