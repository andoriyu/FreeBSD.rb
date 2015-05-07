require 'RbFreeBSD/native/libc/typespec'
module RbFreeBSD::Native
  module LibC
    extend FFI::Library
    ffi_lib [FFI::CURRENT_PROCESS, 'c']

    # time.h

    attach_function :clock_gettime, [:clock_id, :pointer], :int
  end
end
