ActiveAdmin.register Book do 

  form do |f|
   f.inputs "DetailsOfBook" do
     f.input(:title)
   end

  f.has_many :comments do |comment|
    #comment.inputs "CommentsForBook" do
     comment.input :commentforbook
      #repeat as necessary for all fields
    end
  #end
end
# index do
#     column :comments
#    end




   show do 


    attributes_table do
        row :title
        row :author
        row :description
        row  :publisher
        row  :weeks_on_list
        row   :rank_this_week 

       row :image do
         image_tag book.image.url
       
       end
       row :created_at
       row  :updated_at
       row   :image_file_name
       row   :image_content_type
       row  :image_file_size
       row  :image_updated_at
 
    end
    active_admin_comments
  end

end


