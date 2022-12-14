# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Index < Bookshelf::Action
        include Deps['persistence.rom']

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          books =
            rom
            .relations[:books]
            .select(:title, :author)
            .page(request.params[:page] || 1)
            .per_page(request.params[:per_page] || 5)
            .order(:title)
            .to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
