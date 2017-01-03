module ApplicationHelper
	def nav_link(link_text, link_path, icon) 
		
	    class_name = current_page?(link_path)  ? 'active' : ''
	    content_tag(:li) do
	      link_to  link_path, :class => 'skel-layers-ignoreHref '+class_name do
	      	content_tag(:span, link_text, :class=> icon)
	      end
	    end
   end
end
