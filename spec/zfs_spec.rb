require 'spec_helper'
require 'RbFreeBSD'

describe RbFreeBSD::ZFS do
  describe 'list dataets' do
    it 'should give whole list with metadata' do
      expect(RbFreeBSD::ZFS.get_datasets).to be_kind_of(Hash)
    end

    it 'should give list of child dataset for specific dataset' do
      expect(RbFreeBSD::ZFS.get_datasets('tank/testing')).to be_kind_of(Hash)
    end
  end
end
