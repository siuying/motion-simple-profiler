module Profiler
  module ObjectExt
    def profile(symbol)
      _symbol = ("_rm_profile_" + symbol.to_s).to_sym
      alias_method _symbol, symbol

      self.send(:define_method, symbol.to_s) do |*args|
        clazz_name  = self.send(:class).to_s
        method_name = symbol.to_s

        start_time  = Time.now
        result      = self.send(_symbol, *args)
        end_time    = Time.now

        profile_log(clazz_name, method_name, start_time, end_time)

        result
      end
    end

    def profile_log(clazz_name, method_name, start_time, end_time)
      puts "%s#%s runtime: %.5f s" % [clazz_name, method_name, (end_time-start_time).to_f]
    end
  end
  Object.send(:include, ::Profiler::ObjectExt)

  def self.profile(clazz, method)
    clazz.instance_eval do
      profile method
    end
  end
end
