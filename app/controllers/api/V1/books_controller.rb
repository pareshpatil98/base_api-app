module Api
  module V1
    class BooksController < ApplicationController
      # GET /api/v1/books
      def index
        books = Book.all
        render json: books
      end

      # POST /api/v1/books
      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :created
        else
          render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.require(:book).permit(:title, :author)
      end
    end
  end
end
