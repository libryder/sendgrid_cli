module SendgridCli

  class Interface

    def initialize(user, pass)
      @api_user = user
      @api_pass = pass
      if @api_pass.nil? || @api_user.nil?
        raise "Please configure gem before use. Try 'help' for usage."
      end
    end

  public
    def get(command, email=nil)
      query_api(command, 'get', email)
    end

    def delete(command, email)
      query_api(command, 'delete', email)
    end

  private
    def query_api(command, action, email=nil)
      args = "&email=#{email}" unless email.nil?
      send_grid_url = "https://sendgrid.com/api/#{command}.#{action}.json?api_user=#{@api_user}&api_key=#{@api_pass}#{args}"
      
      response = HTTParty.get(send_grid_url)
      JSON.parse(response.body)
    end
  end
end
