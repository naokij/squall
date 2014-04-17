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
      response = request(:post, "/dns_zones.json", query: { pack: options })
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
  end
end
