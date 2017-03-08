class ApplicationService
  self.abstract_class = true

  def perform
    raise NotImplementedError, 'Service should implement perform method.'
  end
end