
module IOMatic
  module Monadic
    autoload :ClassMethods, File.join(File.dirname(__FILE__), "monadic", "class_methods")
    autoload :Context, File.join(File.dirname(__FILE__), "monadic", "context")

    def self.included(base)
      base.extend ClassMethods
      base.class_exec do
        setup_monad Context
      end
    end

    # Pure wraps a pure object into the bare minimal context
    def contextify
      self.class.monadic_context.new self
    end

  end
end