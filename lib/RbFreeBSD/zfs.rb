module RbFreeBSD
  class ZFS
    class << self
      def get_datasets(parent = nil)
        datasets = RbFreeBSD::Open3::ZFS.list_datasets(parent).map do |e|
          split = e.split('/')
          {path: e, name: split.last, parent: split[-2], crumbs: split}
        end
        tree = datasets.inject({}) do |h, dataset|
          tree = h
          dataset[:crumbs].each do |crumb|
            tree[crumb] ||= {path: dataset[:path]}
            tree = tree[crumb]
          end
          h
        end
        comb_tree = lambda do |hash|
          hash.inject({}) do |path, nested|
            path[:name] = nested.first
            path[:path] = nested.last[:path]
            path.merge!(RbFreeBSD::Open3::ZFS.dataset_info(path[:path]))
            path[:children] = []
            nested.last.each do |k,v|
              next if k == :path
              path[:children] << comb_tree.call(k =>v)
            end
            path
          end
        end
        comb_tree.call(tree)
      end
    end
  end
end

