class Page < ActiveRecord::Base
  attr_accessible :body, :is_front_page, :title

  validates :title, presence: { :message => 'Title can not be blank' }

  def self.content_pages
  	Page.where(:is_front_page => false)
  end

  def self.front_pages
  	Page.where(:is_front_page => true)
  end
end
