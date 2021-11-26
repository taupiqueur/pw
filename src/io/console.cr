{% skip_file unless flag?(:windows) %}

class IO::FileDescriptor < IO
  def noecho
    yield self
  end
end
