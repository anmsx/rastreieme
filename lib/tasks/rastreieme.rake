require 'correios'
namespace :rastreieme do

  desc "Atualiza status de cada TrackingNumber que esteja em aberto"
  task :update_tracking_number_status => :environment do
    tn_list = TrackingNumber.get_opens
    puts "OPEN: #{tn_list.length}"
    tn_list.each do |tn|
      puts "Checking #{tn.number}"
      object = Correios.encomenda(tn.number)
      if object.status.count == 0
        puts "---- #{tn.number} not found!"
        next
      end
      puts "---- #{tn.number}"
      puts "---- #{object.ultimo_status_disponivel.situacao}"
      tn.update_remote_status object.ultimo_status_disponivel
      tn.set_delayed_if_delayed
    end
  end


end