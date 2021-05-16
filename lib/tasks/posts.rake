# namespace :posts do
#   desc "TODO"
#   task auto_delete_post: :environment do
#   end

# end


#초 단위 : seconds / 분 단위 : minutes / 일 단위 : days / 월 단위 : months / 년도 단위 : years
# 아래 코드의 기능 : 작성된지 N일 된 게시물을 삭제함.
namespace :posts do
  desc "Delete records older than 30 Days"
  task auto_delete_post: :environment do
    Post.where('created_at < ?', 10.days.ago).each do |post|
      post.destroy
    end
  end
end




