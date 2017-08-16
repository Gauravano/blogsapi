class BlogsController < UsersAuthenticatedController
  before_action :authenticate_user
  def index
  	data = {}
  	data["blogs"] = Blog.all
  	return response_data data,"Listing all Blogs",200
  end

  def create
  	title = params["title"]
  	content = params["content"]
  	blog = Blog.create title: title,content: content
  	return response_data blog,"Blog Created Successfully",200
  end

end
