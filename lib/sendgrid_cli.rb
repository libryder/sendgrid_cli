require "sendgrid_cli/version"

module SendgridCli
  require 'httparty'
  require 'json'

  class SpamReport

    def initialize(user, pass)
      @api_user = user
      @api_pass = pass
    end

  public
    def get(email=nil)
      email_list = query_api('get', email)
    end

    def delete(email)
      query_api('delete', email)
    end

    def print_results(result)
      puts result
      puts ''
      puts "-----#{result.count} results------"
    end

    def help
      puts "\nSendgrid spam reports utility. \n\nAllows you to manage and view your list of spam reports."

      puts "\nUSAGE:\n"
      
      puts "\nconfig user <api_username>  :: Configure api username for gem use"
      puts "config pass <api_secret>      :: Configure api password for gem use" 
      puts "get [<email>]                 :: Get entire list or single blocked recipient."
      puts "delete <email>                :: Delete single recipient from blocked recipient list.\n\n"
      exit
    end

  private
    def query_api(action, email=nil)
      args = "&email=#{email}" unless email.nil?
      send_grid_url = "https://sendgrid.com/api/spamreports.#{action}.json?api_user=#{API_USER}&api_key=#{API_KEY}#{args}"
      
      response = HTTParty.get(send_grid_url)
      JSON.parse(response.body)
    end
  end
end
