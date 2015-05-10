module RbFreeBSD
  class ZFS
    class << self
      def get_datasets(parent = nil)
        datasets = RbFreeBSD::Open3::ZFS.list_datasets(parent)
        tree = datasets.inject({}) do |h, dataset|
          tree = h
          dataset[:crumbs].each do |crumb|
            tree[crumb] ||= {path: dataset[:path]}
            tree = tree[crumb]
          end
          h
        end
        comb_dataset_tree(tree)
      end

      private
      def comb_dataset_tree(hash)
        hash.inject({}) do |path, nested|
          path[:name] = nested.first
          path[:path] = nested.last[:path]
          path.merge!(RbFreeBSD::Open3::ZFS.dataset_info(path[:path]))
          path[:children] = []
          nested.last.each do |k,v|
            next if k == :path
            path[:children] << comb_dataset_tree(k =>v)
          end
          path
        end
      end
    end
  end
end

