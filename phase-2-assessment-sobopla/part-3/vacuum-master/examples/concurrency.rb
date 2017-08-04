require 'benchmark'

req = Vacuum.new
req.associate_tag = 'foobar'
params = {
  'Operation'     => 'ItemSearch',
  'SearchIndex'   => 'KindleStore',
  'ResponseGroup' => 'ItemAttributes,Images',
  'Keywords'      => 'Architecture'
}
opts = (1..5).map do |page|
  req.send(
    :build_options,
    method: :get,
    query: params.dup.update('ItemPage' => page)
  )
end

Benchmark.bm(8) do |x|
  conn = req.connection

  x.report('serial') do
    opts.map { |opt| conn.request(opt) }
  end

  x.report('pipeline') do
    conn.requests(opts)
  end

  x.report('threads') do
    thrs = opts.map do |opt|
      Thread.new { Thread.current[:res] = conn.request(opt) }
    end

    thrs.map { |thr| thr.join[:res] }
  end
end
