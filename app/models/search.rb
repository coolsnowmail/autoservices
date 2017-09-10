class Search < ActiveRecord::Base
  def self.terms_for(prefix)
    services = Service.where("name LIKE ?", "%#{prefix}%").pluck(:name).uniq
    autoservices = Autoservice.where("name LIKE ?", "%#{prefix}%").pluck(:name)
    search = services + autoservices
  end
end
