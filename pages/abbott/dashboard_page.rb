

module Abbott
  class DashboardPage < WebPage
    validates :url, pattern: /#{settings.app_url}\/Announcement\/List$/
    #validates :title, pattern:/^List$/

    def self.open(url="#{settings.app_url}/Announcement/List")
      super
    end
  end
end