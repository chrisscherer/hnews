class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author, :class_name => "User"
  validates :title, :presence => true
  validates :url, :presence => true
  validates :author_id, :presence => true
  validate :validate_url

  def validate_url
    if self.url == "" || ! self.url.match(/.+\.\w{2,}/)
      return errors.add(:url, "This is not a valid web address!")
    end
    unless self.url.match(/\Ahttps?:\/\//)
      self.url = "http://".concat(self.url)
    end
    begin
      parsed_uri = URI(self.url)
      rescue
      return errors.add(:url, "This is not a valid web address!")
    end
    response = Net::HTTP.get_response(parsed_uri)
    unless 200 <= response.code.to_i && response.code.to_i < 400 && response.code.to_i != 303
      return errors.add(:url, "This is not a valid web address!")
    end
  end


end
