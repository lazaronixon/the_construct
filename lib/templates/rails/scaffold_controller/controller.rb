<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: %i[ show edit update destroy ]

  def index
    @search = <%= class_name %>.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @<%= plural_table_name %> = set_page_and_extract_portion_from @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show
    fresh_when etag: @<%= singular_table_name %>
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    @<%= singular_table_name %>.save!

    respond_to do |format|
      format.html { redirect_to <%= redirect_resource_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
      format.json { render :show, status: :created }
    end
  end

  def update
    @<%= singular_table_name %>.update!(<%= "#{singular_table_name}_params" %>)
    respond_to do |format|
      format.html { redirect_to <%= redirect_resource_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
      format.json { render :show }
    end
  end

  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %> }
      format.json { head :no_content }
    end
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    def <%= "#{singular_table_name}_params" %>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    end
end
<% end -%>
