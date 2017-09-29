require_relative '../../repositories/managed_link_repo'

module Resources
  module ManagedLinks
    class Create
      def self.call(params)

      end

      attr_reader :successful, :message, :resulting_url

      def initialize(params)
        @destination_url = params.fetch(:destination_url)
        @managed_link_db = params.fetch(:managed_link_db, ManagedLinkRepo)
        @successful      = false
        @message         = ''
        @resulting_url   = 'https://acima.us'
        @short_code      = nil
      end

      def call
        generate_short_code
        persist_managed_link
        complete_and_respond 
      end

      private

      def generate_short_code
        @short_code = SecureRandom.urlsafe_base64(12)

        generate_short_code unless @managed_link_db::ValidShortCode.call(@short_code)
      end

      def persist_managed_link
        @managed_link_db.create(
          destination_url: @destination_url,
          short_code: @short_code
        )
      end

      def succeed_and_respond
        {
          successful: true,
          message: 'Successfully created managed link',
          resulting_url: "#{@resulting_url}/#{@short_code}"
        }
      end
    end
  end
end
