require 'open3'
module RbFreeBSD::Open3
  class ZFS
    class << self
      def list_datasets(parent = nil)
        cmd = %w(zfs list -H -r -oname -tfilesystem)
        cmd << parent if parent
        stdout, stderr, status = Open3.capture3(*cmd)
        if status.success? and stderr == ""
          stdout.lines.drop(1).collect do |filesystem|
            filesystem.chomp
          end
        else
          raise Exception, "something went wrong"
        end
      end

      def dataset_info(dataset)
        cmd = %w(zfs list -H -omounted,available,used,compressratio,mountpoint)
        cmd << dataset
        stdout, stderr, status = Open3.capture3(*cmd)
        if status.success? and stderr == ""
          line = stdout.chomp.split("\t")
          {
            mounted: line[0],
            available: line[1],
            used: line[2],
            compressratio: line[3],
            mountpoint: line[4]
          }
        else
          raise Exception, "something went wrong"
        end
      end
    end
  end
end
