# encoding: UTF-8

class WpTarget < WebSite
  module WpFullPathDisclosure

    # Check for Full Path Disclosure (FPD)
    #
    # @return [ Boolean ]
    def has_full_path_disclosure
      response = Browser.get(full_path_disclosure_url())
      if (response.body[%r{Fatal error}i])
         then return response.body.scan(/in <b>([^\s]*?)<\/b> on/)[0][0]
         else return false
      end
    end

    # @return [ String ]
    def full_path_disclosure_url
      @uri.merge('wp-includes/rss-functions.php').to_s
    end

  end
end
