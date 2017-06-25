require 'ramda'

module Bench
  # Save benchmark results to ./bench_results directory.
  module RunBenchmarkToFile
    extend SingleForwardable

    def_delegators Ramda, *(Ramda.methods - Module.methods)

    module_function

    # rubocop:disable Metrics/MethodLength
    def init
      compose(
        map(save_results_fn),
        to_pairs,
        map(
          compose(
            join("\n"),
            map(->(t) { t.join[:result] }),
            map(method(:with_thread))
          )
        ),
        group_by_type
      )
    end
    # rubocop:enable Metrics/MethodLength

    private_class_method

    def with_thread(file)
      fetch_results = ->(f) { `bundle exec rake ramda:run_benchmark[#{f}]` }

      Thread.new do
        Thread.current[:result] = compose(
          prepare_content,
          fetch_results,
          Ramda.tap(log)
        ).call(file)
      end
    end

    def group_by_type
      group_by(compose(nth(1), split('/')))
    end

    def prepare_content
      compose(
        md_add_link_to_file,
        md_wrap_code,
        encode
      )
    end

    def encode
      invoker(2, 'encode').call(Encoding.find('ASCII'),
                                invalid: :replace,
                                replace: '',
                                universal_newline: true)
    end

    def save_results_fn
      type_file_name_fn = compose(
        replace('{type}', __, './bench_results/{type}.md'),
        to_upper
      )

      ->((type, str)) { File.write(type_file_name_fn.call(type), str) }
    end

    def md_wrap_code
      replace('{cont}', __, join("\n", ['', '```sh', '{cont}', '```', '']))
    end

    def md_add_link_to_file
      link_to_file = compose(
        replace('{link}', __, '[Code](../{link})'),
        match(/(bench.+rb)/)
      )

      compose(join("\n"), juxt([link_to_file, identity]))
    end

    def log
      method(:puts)
    end
  end
end
