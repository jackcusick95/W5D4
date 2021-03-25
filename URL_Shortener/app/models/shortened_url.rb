# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  short_url :string
#  long_url  :string           not null
#  user_id   :integer          not null
#
class ShortenedUrl < ApplicationRecord

    validates :long_url, presence: true 
    validates :user_id, presence: true 

    belongs_to :shortened_url,
        primary_key: :id,
        foreign_key: :short_url,
        class_name: :ShortenedUrl 

     belongs_to :long_url,
        primary_key: :id,
        foreign_key: :long_url,
        class_name: :ShortenedUrl 

    def random_code
        SecureRandom.urlsafe_base64
    end 

end 
