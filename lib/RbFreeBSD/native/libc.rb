require 'ffi'
require 'RbFreeBSD/native/libc/types'
require 'RbFreeBSD/native/libc/enums'
require 'RbFreeBSD/native/libc/libc'

module RbFreeBSD::Native::LibC
  class Sugar
    def self.get_time(clock_id)
      time_ptr = FFI::MemoryPointer.new(RbFreeBSD::Native::LibC::TimeSpec.size)
      time = RbFreeBSD::Native::LibC::TimeSpec.new(time_ptr)
      unless RbFreeBSD::Native::LibC.clock_gettime(clock_id, time_ptr) == 0
        raise
      else
        uptime = time[:tv_sec]
        time_ptr.free
        return uptime
      end
    end
  end
end
