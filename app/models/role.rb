class Role

  attr_accessor :host, :guest

  def initialize(host = nil, guest = nil)
    @host = host
    @guest = guest
  end

  def kind
    if @host != nil && @guest == nil
      'host'
    elsif @guest != nil && @host == nil
      'guest'
    elsif @host != nil && @guest != nil
      'both'
    elsif @host == nil && @guest == nil
      'none'
    end
  end

end
