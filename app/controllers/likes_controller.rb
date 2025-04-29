class LikesController < ApplicationController
  def create
    @practice_match = PracticeMatch.find(params[:practice_match_id])
    
        # すでにマッチングしていないか確認
    unless Like.exists?(user: current_user, practice_match: @practice_match)
          # マッチング成立
      like = Like.create!(
        user: current_user,
        practice_match: @practice_match,
        like_status: :matched
      )
    
          # 通知を作成
    #   Notification.create!(
    #     user: @practice_match.user, # 募集主
    #     message: "#{current_user.profile.name}さんとマッチングしました！"
    #   )
    
          # チャットルームを作成
    #   room = Room.create!
    #   room.users << [current_user, @practice_match.user]
    
          # ルームにリダイレクト
    #   redirect_to room_path(room), notice: "マッチング成立！チャットを開始しましょう！"
      redirect_to root_path, notice: "マッチング成立！チャットを開始しましょう！"
    else
      redirect_to practice_match_path(@practice_match), alert: "すでにマッチングしています。"
    end
  end
end
