module ApplicationHelper

def check_parser
require 'open-uri'
 begin
  open("http://knigi.ua:8081")
   rescue Errno::ECONNREFUSED
    print "error"
  end
end


end
