class Response
  def success?
    raise NotImplementedError, 'Response should return is it success.'
  end
end