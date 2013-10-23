class NexuseReport

  include Datagrid
  scope do
    Nexuse.asc(:pages)
  end
  #filter(:category, :enum, :select => ["first", "second"])
  ##filter(:disabled, :eboolean)
  ##filter(:group_id, :integer, :multiple => true)
  ##filter(:logins_count, :integer, :range => true, :before => :group_id)
  ##filter(:group_name, :string, :header => "Group", :after => :category_id) do |value|
  ##  self.joins(:group).where(:groups => {:name => value})
  #end
  filter(:presence, :eboolean, :header => "Присутсвтие")
  filter(:moderation, :eboolean, :header => "Обработка")
  filter :title, :header => "Название (содержит)" do |value|
    where(:title => /#{Regexp.escape(value)}/i)
  end
    filter :article, :header => "Артикль (содержит)" do |value|
    where(:article => /#{Regexp.escape(value)}/i)
  end
  filter :isbn, :header => "ISBN (содержит)" do |value|
    where(:isbn => /#{Regexp.escape(value)}/i)
  end
  column(:title)
  column(:article)
  column(:pricetax)
  column(:pages)
  column(:year)
  column(:onpn)
  column(:author)
  column(:header)
  column(:std)
  column(:price)
  column(:presence)

  column(:actions, :html => true)  { |asset| 
                                     link_to "Показать", nexuse_path(asset)
                                     #link_to "Редактировать", edit_nexuse_path(asset)
                                     #link_to "Удалить", asset, :method => :delete, :data => { :confirm => 'Are you sure?' } 
                                   }
  #filter :author, :header => "Author (regexp)" do |value|
  #  begin
  #    where(:author => Regexp.compile(value))
  #  rescue RegexpError
  #    where
  #  end
  #end
  #column(:group, :order => "groups.name") do |user|
  #  user.name
  #end
  #column(:active, :header => "Activated") do |user|
  #  !user.disabled
  #end
end


class NexuseReportLong
  include Datagrid
  scope do
    Nexuse.asc(:pages)
  end
  filter(:presence, :eboolean, :header => "Присутсвтие")
  filter :title, :header => "Название (содержит)" do |value|
    where(:title => /#{Regexp.escape(value)}/i)
  end
    filter :article, :header => "Артикль (содержит)" do |value|
    where(:article => /#{Regexp.escape(value)}/i)
  end
  filter :isbn, :header => "ISBN (содержит)" do |value|
    where(:isbn => /#{Regexp.escape(value)}/i)
  end
  column(:title)
  column(:pricetax)
  column(:pages)
  column(:year)
  column(:onpn)
  column(:author)
  column(:header)
  column(:std)
  column(:price)
  column(:publisher)       #
  column(:translate)       #
  column(:sid)             #
  column(:year)            #
  column(:genre)           #
  column(:series)          #
  column(:format)          #
  column(:isbn)            #
  column(:article)         #
  column(:ean)             #
  column(:category)        #
  column(:presence)
  column(:actions, :html => true)  { |asset| 
                                     link_to "Показать", nexuse_path(asset)
                                     #link_to "Редактировать", edit_nexuse_path(asset)
                                     #link_to "Удалить", asset, :method => :delete, :data => { :confirm => 'Are you sure?' } 
                                   }
end
