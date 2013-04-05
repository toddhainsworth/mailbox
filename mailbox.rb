class Mailbox
    def initialize(*args)
        @args = args
        @user = ENV['USER']

        # Create the .mailbox directory in the users home directory if it doesnt exist 
        Dir.mkdir(ENV['HOME'] + '/.mailbox') unless File.exists?(ENV['HOME'] + '/.mailbox')

        if @args[0] == '-n'
            new
        elsif @args[0] == '-f'
            fetch
        elsif @args[0] == '-d'
            delete 
        else
            help
        end
    end

    def new

    end

    def fetch 

    end

    def delete

    end

    def help
        puts <<-EOH
            Usage
            -----
            new <recipient>: Send mail to a user on this system
            fetch: Fetch your mail
            delete <id>: Delete mail based on the <id>
            help: Show this text
        EOH
    end
end

mailbox = Mailbox.new(*ARGV)
