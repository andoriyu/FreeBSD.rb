module RbFreeBSD
  class Sysinfo
    def self.uptime
      RbFreeBSD::Native::LibC::Sugar.get_time(:clock_uptime)
    end
  end
end
