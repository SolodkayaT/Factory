class Factory

  def self.new(*arguments, &block)

    Class.new do

      attr_accessor *arguments

    define_method :initialize do |*values|
      arguments.each_with_index do |arg, index|
      send("#{arg}=",values[index])
      end
    end

    define_method :[] do |arg|
      arg.is_a?(Numeric)? send("#{arguments[arg]}") : send(arg)
    end

    define_method :[]= do |arg, value|
      arg.is_a?(Numeric)? send("#{arguments[arg]}=",value) : send("#{arg}=",value)
    end

    class_eval(&block) if block_given?

  end
  end

end
