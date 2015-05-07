module RbFreeBSD::Native
  module LibC
    extend FFI::Library
    # time.h
    enum :clock_id, [
      :clock_realtime, 0,
      :clock_virtual, 1,
      :clock_prof, 2,
      :clock_monotonic, 4,
      :clock_uptime, 5,
      :clock_uptime_precise, 7,
      :clock_uptime_fast, 8,
      :clock_realtime_precise, 9,
      :clock_realtime_fast, 10,
      :clock_monotonic_precise, 11,
      :clock_monotonic_fast, 12,
      :clock_second, 13,
      :clock_thread_cputime_id, 14,
      :clock_process_cputime_id, 15
    ]
  end
end
