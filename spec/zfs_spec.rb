require 'spec_helper'
require 'RbFreeBSD'

describe RbFreeBSD::ZFS do
  describe 'list datasets' do
    it 'should give whole list with metadata' do
      expect(RbFreeBSD::ZFS.get_datasets).to be_kind_of(Hash)
    end

    it 'should give list of child dataset for specific dataset' do
      dataset = RbFreeBSD::ZFS.get_datasets[:children].first[:path]
      expect(RbFreeBSD::ZFS.get_datasets(dataset)).to be_kind_of(Hash)
    end

    it 'should raise on fake dataset' do
      expect {RbFreeBSD::ZFS.get_datasets('reallyrfasdasdasd')}.to raise_error
    end
  end
end
