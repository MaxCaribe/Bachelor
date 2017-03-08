class Error < Response
  attr_reader :error

  def initialize(error)
    @error = error
  end

  def success?
    false
  end
end