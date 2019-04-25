class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, :short_url, uniqueness: true
      t.integer :submitter_id

      t.timestamps
    end

     add_index(:shortened_urls, :short_url)
  end
end
