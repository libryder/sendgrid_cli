require "sendgrid_cli/version"

module SendgridCli
  require 'httparty'
  require 'json'

  class SpamReport

    def initialize(user, pass)
      @api_user = user
      @api_pass = pass
      if @api_pass.nil? || @api_user.nil?
        raise "Please configure gem before use. Try 'help' for usage."
      end
    end

  public
    def get(email=nil)
      query_api('get', email)
    end

    def delete(email)
      query_api('delete', email)
    end

  private
    def query_api(action, email=nil)
      args = "&email=#{email}" unless email.nil?
      send_grid_url = "https://sendgrid.com/api/spamreports.#{action}.json?api_user=#{@api_user}&api_key=#{@api_pass}#{args}"
      
      response = HTTParty.get(send_grid_url)
      JSON.parse(response.body)
    end
  end
end
