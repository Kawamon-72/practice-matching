class LikesController < ApplicationController
  def create
    @practice_match = PracticeMatch.find(params[:practice_match_id])
  
    unless Like.exists?(user: current_user, practice_match: @practice_match)
      @matching = @practice_match.user_practice_matches.build(user: current_user)

  
      if @matching.save
        if current_user.id != @practice_match.user.id
          Notification.create(
            visitor_id: current_user.id,
            visited_id: @practice_match.user.id,
            practice_match_id: @practice_match.id,
            action: 'match',
            checked: false
        )
        end
  
        redirect_to notifications_path, notice: "マッチング成立！"
      else
        redirect_to practice_match_path(@practice_match), alert: "マッチングに失敗しました。"
      end
    else
      redirect_to practice_match_path(@practice_match), alert: "すでにマッチングしています。"
    end
  end
end
