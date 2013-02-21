Simple Profiler for RubyMotion
==============================

motion-simple-profiler measure a function's runtime, without actualy the needs of changing the function itself. 

Use it when you need to know how long it takes for a function to run, but you don't want to use tools like instruments.

## Installation


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
*** MyClass#long_running_task runtime: 1.633041s ***
```

## About

motion-simple-profiler is inspired by [NanoProfiler](https://raw.github.com/tomersh/NanoProfiler).

