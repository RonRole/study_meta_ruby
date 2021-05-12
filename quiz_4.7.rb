def setup(&block)
    @env.instance_eval {
        @setups ||= []
        @setups << block
    }
end

def event(description, &block)
    @env.instance_eval {
        @setups.each(&:call)
        puts "ALERT:#{description}" if block.call
    }
end

@env = Object.new

load('quiz_4.7_events')
