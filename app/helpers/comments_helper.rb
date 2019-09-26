module CommentsHelper

  def formatDate(comment)
    "#{time_ago_in_words(comment.created_at)} ago"
  end

  def getUsername(comment)
    if comment.user.username.blank?
      comment.user.username = 'anonym'
    else
      comment.user.username
    end
  end

end
