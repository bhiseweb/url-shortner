class Link < ApplicationRecord
  belongs_to :user
  before_save :add_token
  validates :main_url, :presence => true


  def add_token
    if self.token.nil?
      self.token = rand(36**8).to_s(36)
    end
  end

  def redirection_url
    self.update(clicks: (self.clicks + 1))
    main_url
  end
end
