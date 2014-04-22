module Squall
  # OnApp DNS Zones
  class DnsZone < Base
    # Public: List DNS zones.
    #
    # Returns an Array.
    def list
      response = request(:get, "/dns_zones.json")
      response["dns_zones"]
    end

    # Public: Get the details for a DNS zone.
    #
    # id - ID of the DNS store zone
    #
    # Returns a Hash.
    def show(id)
      response = request(:get, "/dns_zones/#{id}.json")
      response['dns_zone']
    end

    # Public: Adds a new DNS Zone.
    #
    # options - Params for the data store zone:
    #           :name - Domain name
    #           :autopopulate - Autopopulate DNS records for this domain
    #
    # Returns a Hash.
    def create(options = {})
      response = request(:post, "/dns_zones.json", default_params(options))
      response['dns_zone']
    end

    # Public: Deletes an existing DNS Zone.
    #
    # id - ID of the DNS zone
    #
    # Returns an empty Hash.
    def delete(id)
      request(:delete, "/dns_zones/#{id}.json")
    end

    # Public: Grabs all the records associated with a DNS zone.
    #
    # id - ID of the DNS zone
    #
    # Returns a Hash.
    def records(id)
      response = request(:get, "/dns_zones/#{id}/records.json")
      response['dns_zone']
    end

    # Public: Adds new DNS Zone Record for a DNS Zone.
    #
    # zone_id - ID of the DNS zone
    # options - dns_record hash
    #
    # Returns a DNS Record hash.
    def create_record(zone_id, options)
      response = request(:post, "/dns_zones/#{zone_id}/records.json", query_params(options))
      response['dns_record']
    end

    # Public: Edits a DNS Zone Record for a DNS Zone.
    #
    # zone_id - ID of the DNS zone
    # record_id - ID of the Record
    # options - dns_record hash
    #
    # Returns nothing.
    def edit_record(zone_id, record_id, options)
      request(:put, "/dns_zones/#{zone_id}/records/#{record_id}.json", query_params(options))
    end

    # Public: Deletes a DNS Zone Record in a DNS Zone.
    #
    # zone_id - ID of the DNS zone
    # record_id - ID of the Record
    #
    # Returns an empty hash.
    def delete_record(zone_id, record_id)
      request(:delete, "/dns_zones/#{zone_id}/records/#{record_id}.json")
    end

    # Public: Grabs the configured nameservers.
    #
    # Returns an array of records.
    def nameservers
      response = request(:get, "/settings/dns_zones/name-servers.json")
      response['dns_zones']
    end
  end
end
