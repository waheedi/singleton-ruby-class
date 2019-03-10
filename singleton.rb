class Singleton

  def self.allocate
    @instance ||= super
  end

  def clone
    @instance ||= super
  end

  def dup
    @instance ||= super
  end

  def self.new
    @instance ||= super
  end

  def self.singleton_method_added(method)
    @singleton_new_trial ||= (0..1).cycle
    if method.to_sym == :new || method.to_sym == :allocate
      method_symbol = method.to_sym
      self.define_singleton_method(method_symbol, Singleton.singleton_method(method_symbol)) if @singleton_new_trial.next == 0
      raise TypeError,  "You can't define a singleton #{method_symbol} method while inheriting from Singleton"
    end
  end

  def self.method_added(method)
    @instance_clone_trial ||= (0..1).cycle
    puts "method name is #{method}"
    if method.to_sym == :clone || method.to_sym == :dup
      method_symbol = method.to_sym
      self.define_method(method_symbol, Singleton.method(method_symbol)) if @instance_clone_trial.next == 0
      raise TypeError,  "You can't define a singleton #{method_symbol} method while inheriting from Singleton"
    end
  end

  def self.instance
    @instance
  end

  def self.instance?
    @instance != nil
  end

end
