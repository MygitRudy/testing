module Abbott
  class HomePage < WebPage
  	
    validates :title, pattern: /^Abbott Singapore$/

    def self.open(url="#{settings.app_url}")
      super
    end

  end
end