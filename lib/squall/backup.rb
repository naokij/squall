module Squall
  # OnApp Backups
  class Backup < Base
    # Public: Get info for a backup.
    #
    # id - ID of the backup
    #
    # Returns a Hash.
    def show(id)
      response = request(:get, "/backups/#{id}.json")
      response["backup"]
    end

    # Public: Restore backup.
    #
    # id - ID of the backup to restore
    #
    # Returns nothing.
    def restore(id)
      request(:post, "/backups/#{id}/restore.json")
    end

    # Public: Delete backup.
    #
    # id - ID of the backup to delete
    #
    # Returns nothing.
    def delete(id)
      request(:delete, "/backups/#{id}.json")
    end
  end
end