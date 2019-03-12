require 'faraday'
require 'json'
require 'dry/inflector'

$VERBOSE = nil

require "logger"

Faraday.new do |faraday|
    faraday.response :logger, Logger.new(STDOUT), bodies: true
end

=begin
    Example Trial

    "trialNumber": "IPR2016-00831",
    "applicationNumber": "09026118",
    "patentNumber": "6162705",
    "petitionerPartyName": "Commissariat a l’Energie Atomique et aux Energies Alternatives",
    "patentOwnerName": "Silicon Genesis Corporation",
    "inventorName": "FRANCOIS HENLEY",
    "prosecutionStatus": "Terminated-Settled",
    "filingDate": "2016-04-01",
    "accordedFilingDate": "2016-04-01",
    "institutionDecisionDate": "2016-09-28",
    "lastModifiedDatetime": "2017-07-06T16:06:59",
=end

module PtabManager
    include Enumerable
    @page_size = 25

    def initialize(params=Hash.new)
        @params = params
        @conn = Faraday.new(
            :url => "https://ptabdata.uspto.gov"
        )
        @pages = {}
    end

    def get(*args, **kwargs)
        new_manager = filter(*args, **kwargs)
        new_manager.first()
    end

    def filter(*args, **kwargs)
        if args
            kwargs["trialNumber"] = args[0]
        end
        new_params = @params.merge(kwargs)

        self.class.new(new_params)
    end

    def get_page(page_no=0)
        if not @pages.key? page_no
            params = @params.merge({"page_no" => page_no+1})
            url_params = Hash.new
            inflector = Dry::Inflector.new
            params.each_pair do |key, value|
                new_key = inflector.camelize(key)
                new_key = new_key[0].downcase + new_key[1..]
                url_params[new_key] = value
            end
            response = @conn.get "ptab-api/trials", url_params
            @pages[page_no] = JSON.parse(response.body)
        end
        @pages[page_no]
    end

    def length
        page_one = get_page()
        page_one["metadata"]["count"]
    end

    def each
        puts "Record Class #{self.record_class_name}"
        (0..(length-1)).each do |index|
            position = index % 25
            page_no = (index / 25).floor
            yield get_page(page_no)["results"][position]
        end
    end
end

class PtabModel
    def initialize(data)
        inflector = Dry::Inflector.new
        data.each {|key, value| 
            underscore_key = inflector.underscore(key)
            instance_variable_set("@#{underscore_key}", value)
            self.class.send(:attr_reader, underscore_key) # Dynamically create an accessor
        }
    end

    def self.objects
        @objects
    end
end

class PtabTrialManager
    include PtabManager
    @path = "ptab-api/trials"
    @default_filter = "trial_number"
    @record_class_name = "PtabTrial"

    class << self; attr_accessor :record_class_name end
end

class PtabTrial < PtabModel
    @objects = PtabTrialManager.new()
end
=begin
class PtabDocumentManager < PtabManager
    @path = "ptab-api/documents"
    @default_filter = "trial_number"
    @record_class_name = 'PtabDocument'
end

class PtabDocument < PtabModel
    @objects = PtabDocumentManager.new()
end
=end
