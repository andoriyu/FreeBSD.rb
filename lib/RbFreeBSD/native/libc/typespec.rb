module RbFreeBSD::Native::LibC
  class TimeSpec < FFI::Struct
    layout  :tv_sec, :time_t,
            :tv_nsec, :long
  end
end
