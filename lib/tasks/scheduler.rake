task :mail_for_stores => :environment do
  if Time.now.monday? # previous answer: Date.today.wday == 5
    #do something
    @users = User.where("role = ? AND last_seen_at < ? AND subscription = ?", "Store", 2.weeks.ago, true).all
    @users.each do |user|
      @user = user
      if @user.store.nil?
        if @user.last_seen_at < 1.month.ago
        UserMailer.mail_for_store_general(user).deliver
        else
        end
      else
        @store_for_notif = Store.where(user_id: @user.id).take
        @general_notif = SenderNotification.where(store_id: @store_for_notif.id).take
        if @general_notif.nil?
        elsif @general_notif.general_notification == true
          UserMailer.mail_for_store_general(user).deliver
        else
        end
      end

    end
  end
end

task :mail_for_delivery_companies => :environment do
  if Time.now.monday? # previous answer: Date.today.wday == 5
    #do something
    @users = User.where("role = ? AND last_seen_at < ? AND subscription = ?", "Delivery company", 6.weeks.ago, true).all
    @users.each do |user|
      @user = user
      if @user.delivery_company.nil?
        if @user.last_seen_at < 3.month.ago
          UserMailer.mail_for_delivery_company_general(user).deliver
        else
        end
      else
        @delivery_company_for_notif = DeliveryCompany.where(user_id: @user.id).take
        @general_notif_del_co = DeliveryCompanyNotification.where(store_id: @delivery_company_for_notif.id).take
        if @general_notif_del_co.nil?
        elsif @general_notif_del_co.general_notification == true
          UserMailer.mail_for_delivery_company_general(user).deliver
        else
        end
      end

    end
  end
end