module ApplicationHelper
	def nav_link(link_text, link_path, icon,parent = '') 
		
	    class_name = current_page?(link_path) || params[:controller] == parent  ? 'active' : ''
	    content_tag(:li) do
	      link_to  link_path, :class => 'skel-layers-ignoreHref '+' '+class_name do
	      	content_tag(:span, link_text, :class=> icon)
	      end
	    end
   end
end
