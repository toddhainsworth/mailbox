class Mailbox
    VERSION = "0.1d"
    def initialize(*args)
        @args = args
        @user = ENV['USER']

        # Create the .mailbox directory in the users home directory if it doesnt exist 
        Dir.mkdir(ENV['HOME'] + '/.mailbox') unless File.exists?(ENV['HOME'] + '/.mailbox')
        
        if @args[0] == '-n'
            new
        elsif @args[0] == '-d'
            delete
        elsif @args[0] == '-h'
            help
        elsif @args[0] == '-v'
            puts "Version #{VERSION}"
            puts "2013 GNU GPL. Author: GeissT"
        else
            fetch
        end
    end

    def new
        print "Recipient: "
        recip = STDIN.gets.chomp!
        print "Message: "
        body = STDIN.gets.chomp!

        mailfile = "/home/" + recip + "/.mailbox/new.mail"

        # Read contents so we can append
        contents = File.read(mailfile)

        body << " - " + @user

        File.open("/home/#{recip}/.mailbox/new.mail", 'w') do |f|
            message = contents + body + "\n"
            f.write(message)
        end

        puts "Mail sent!\n"
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
