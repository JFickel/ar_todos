require_relative '../../config/application'

module View
  def self.request_add
    if ARGV[0]=='add'
      return ARGV[1..-1].join
    end
  end

  def self.request_delete
    if ARGV[0]=='delete'
      return ARGV[1].to_i
    end
  end

  def self.request_complete
    if ARGV[0]=='complete'
      return ARGV[1].to_i
    end
  end

  def self.request_list
    if ARGV[0]=='list'
      i=1
      Tasks.find_each do |task|
        puts "#{i}. #{task.complete ? '[ ]' : '[X]' } #{task.description}"
        i+=1
      end
    else
      return false
    end
  end
end
