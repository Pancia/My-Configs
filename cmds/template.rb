module CMD
  def example(opts)
    opts.banner = "Usage: example"
    opts.info = "FIXME"
    lambda { |*args|
      EXE.system %{
        echo "FIXME"
      }
    }
  end
end

trap "SIGINT" do
  exit 130
end
