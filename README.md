Simple Profiler for RubyMotion
==============================

motion-simple-profiler is a RubyMotion extension to log method runtime without adding a single line of code to original class.

Use it when you need to know how long it takes for a function to run, but you don't want to use tools like instruments.

## Install

1. ```gem 'motion-simple-profiler'```
2. ```require 'motion-simple-profiler'``` or add to your ```Gemfile```

## Usage

```ruby
class MyClass
  def long_running_task
    # ... run the task
  end
end

Profiler.profile MyClass, :long_running_task 
```

Running `self.long_running_task` will print:

```
MyClass#long_running_task runtime: 1.63304 s
```

## Customization

You can modify the profiler log output by override the Profiler::ObjectExt#profile_log method.

For example:

```ruby
module Profiler
  module ObjectExt
    def profile_log(clazz_name, method_name, start_time, end_time)
      puts "*** %s#%s -> %.5fs" % [clazz_name, method_name, (end_time-start_time).to_f]
    end
  end
end
```

Same example above will print:

```
*** MyClass#long_running_task -> 1.63304s
```

## About

motion-simple-profiler is inspired by [Ruby AOP in 12 lines of Code](http://uberpwn.wordpress.com/2011/03/14/ruby-aop-in-12-lines-of-code/) and [NanoProfiler](https://raw.github.com/tomersh/NanoProfiler).

## License

Please refer to [LICENSE](https://raw.github.com/siuying/motion-simple-profiler/master/LICENSE).