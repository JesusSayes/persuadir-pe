# coding: utf-8
module ApplicationHelper

  def user_tools(object, back=true, options={})
    obj = object.is_a?(Array) ? object.last : object
    if can? :manage, obj
      txt = []
      txt << link_to(content_tag(:i,nil,:class=>"icon-edit")+" Modificar", edit_polymorphic_path(object), {:title=>"Modificar", :class => 'btn btn-small'}.merge(options))
      txt << link_to(content_tag(:i,nil,:class=>"icon-eye-open")+" Mostrar", object, {:title=>"Mostrar",:class => 'btn btn-small'}.merge(options))
      if back
        (txt << link_to(content_tag(:i,nil, :class=>"icon-chevron-left") + " Regresar", url_for( :controller=>object.class.name.tableize.pluralize, :action=>:index), {:title=>"Regresar"}.merge(options) )) unless object.is_a?(Array)
        (txt << link_to(content_tag(:i,nil, :class=>"icon-chevron-left") + " Regresar", polymorphic_path( object[0, object.size-1] + [obj.class.name.tableize.pluralize]), {:title=>"Regresar"}.merge(options) )) if object.is_a?(Array)
      end
      txt << link_to(content_tag(:i,nil,:class=>"icon-remove icon-white") + " Eliminar", object,
        {:title=>"Destroy", :confirm => "#{obj.class.name.tableize} será eliminado.... \n ¿Seguro?",
        :method => :delete, :class => 'btn btn-small btn-danger'}.merge(options)) unless obj.new_record?

      content_tag(:div, (txt.join(" &nbsp; ")).html_safe, :class=>"btn-group")
    end
  end

  def new_tool(object, query={}, options={})
    txt = ""
    unless object.is_a?(Array)
      txt << link_to(content_tag(:i,nil,:class=>"icon-plus")+" Nuevo #{object.name.tableize.humanize.titleize.singularize}",  new_polymorphic_path(object, query), {:title=>"Crear", :class => 'btn btn-primary'}.merge(options))
    else
      txt << link_to(content_tag(:i,nil,:class=>"icon-plus")+" Nuevo #{object.last.name.tableize.humanize.titleize.singularize}", new_polymorphic_path(object, query) , {:title=>"Crear", :class => 'btn btn-primary'}.merge(options))
    end
    if can? :create, (object.is_a?(Array) ? object.last : object)
      content_tag(:div, txt.html_safe, :class=>"tools")
    end
  end

  def destroy_tool(object, options={})
    obj = object.is_a?(Array) ? object.last : object
    link_to(content_tag(:i,nil,:class=>"icon-remove icon-white") + " Eliminar", object,
      {:title=>"Destroy", :confirm => "#{obj.class.name.tableize} será eliminado.... \n ¿Seguro?",
      :method => :delete, :class => 'btn btn-small btn-danger'}.merge(options))
  end

  def tick(v=true,title="va")
    if v
      content_tag(:span,
        content_tag(:i,nil,:class=>"icon-ok")+ " Sí",
      :class=>"label label-success")
    else
      content_tag(:span,
        content_tag(:i,nil,:class=>"icon-remove")+ " No",
      :class=>"label label-important")
    end
  end


end
