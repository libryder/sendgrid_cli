module SendgridCli
  class SpamReport < Interface

  public
    def get(email=nil)
      super('spamreports', email)
    end

    def delete(email)
      super('spamreports', email)
    end

  end
end