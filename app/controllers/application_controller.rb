class ApplicationController < ActionController::API
  before_action :set_partition_name_to_thread
  
  include ExceptionHandler
  DEFAULT_PAGE_SIZE = 10

  def paginate(queryset)
    return queryset.all if params[:paginate] == 'false'

    limit = (params[:page_size] || DEFAULT_PAGE_SIZE).to_i
    offset = (((params[:page] || 1).to_i)-1) * limit

    queryset.offset(offset).limit(limit)
  end

  private

  def set_partition_name_to_thread
    # Extract partition name from request parameters or headers
    # For example, if the partition name is passed as a query parameter named 'partition'
    Thread.current[:location] = params[:location]
  end
end
