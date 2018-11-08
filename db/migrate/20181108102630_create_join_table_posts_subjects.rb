class CreateJoinTablePostsSubjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :subjects, id: false do |t|
      # t.index [:post_id, :subject_id]
      # t.index [:subject_id, :post_id]
    end
  end
end
