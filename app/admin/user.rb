ActiveAdmin.register User do
menu priority: 3
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name,:title,:image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# ------------------------ view --------------------
	form do |f|

		f.inputs 'Details' do
	      f.input :name
	      f.input :title
	      f.input :image ,:as =>"file",:image_preview => true,label: 'Avartar photo'  
	    end
	    f.submit lable: 'Submit'


	end
end
