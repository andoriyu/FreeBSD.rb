require 'spec_helper'
require 'RbFreeBSD'

describe RbFreeBSD::Sysinfo do
  describe 'uptime' do
    it 'should return uptime in seconds' do
      expect(RbFreeBSD::Sysinfo.uptime).to be > 0
    end
  end
end
