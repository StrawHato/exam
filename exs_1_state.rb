class State
  def handle(context)
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class ConcreteStateA < State
  def handle(context)
    puts 'Handling state A'
    context.state = ConcreteStateB.new
  end
end

class ConcreteStateB < State
  def handle(context)
    puts 'Handling state B'
    context.state = ConcreteStateA.new
  end
end

class Context
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def request
    @state.handle(self)
  end
end

context = Context.new(ConcreteStateA.new)
context.request
context.request