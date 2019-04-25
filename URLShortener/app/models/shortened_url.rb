# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint(8)        not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShortenedUrl < ApplicationRecord
    before_validation :random_code
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true, uniqueness: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name:  :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :url_id,
        class_name:  :Visit
    
    has_many :visitors,
        through: :visits,
        source: :user

    has_many :distinct_visitors,
        Proc.new {distinct},
        through: :visits,
        source: :user

    def random_code
        rand = SecureRandom.urlsafe_base64(16)
        until !ShortenedUrl.exists?(:short_url => rand )
            rand = SecureRandom.urlsafe_base64(16)
        end

        self.short_url = rand
    end

    def self.create_new_short_url(user, long_url)
        s = ShortenedUrl.new(:long_url => long_url, :submitter_id => user.id)
        s.save
    end

    def num_clicks
        self.visitors.length
    end

    def num_uniques
        self.distinct_visitors.length
    end

    def num_recent_uniques
        recents = self.distinct_visitors.where(created_at: 60.minutes.ago..Time.now)
        recents.length
    end
end
