module Monopoly
  EventCards = CardStack.new("Ereigniskarte", [
    Card.new("R\xC3\xBCcke vor bis zur Schlo\xC3\x9fallee.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(40))
    end,
    Card.new("Strafe f\xC3\xBCr zu schnelles Fahren: DM 300,-") do |card, card_stack, player, other_players, playing_field|
      player.transfer_money_to(:bank, 300)
    end,
    Card.new("R\xC3\xBCcke vor bis zum n\xC3\xA4chsten Bahnhof. Der Eigent\xC3\xBCmer erh\xC3\xA4lt das Doppelte der normalen Miete. Hat noch kein Spieler einen Besitzanspruch auf diesen Bahnhof, so kannst Du ihn von der Bank kaufen.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.next_field_of_type(player, Fields::Station))
    end,
    Card.new("Gehe zur\xC3\xBCck zu Badstra\xC3\x9fe") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(2), :backward)
    end,
    Card.new("Miete und Anleihezinsen werden f\xC3\xA4llig. Die Bank zahlt Dir DM 3000,-") do |card, card_stack, player, other_players, playing_field|
      player.raise_money(3000)
    end,
    Card.new("Mache einen Ausflug zum S\xC3\xBCdbahnhof. Wenn du \xC3\xBCber LOS kommst, ziehe DM 4000,- ein.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(6))
    end,
    Card.new("Lasse alle Deine H\xC3\xA4user renovieren! Zahle an die Bank: F\xC3\xBCr jedes Haus DM 500,- F\xC3\xBCr jedes Hotel DM 2000,-") do |card, card_stack, player, other_players, playing_field|
      player.transfer_money_to(:bank, 500 * player.houses + 2000 * player.hotels)
    end,
    Card.new("Gehe in das Gef\xC3\xA4ngnis! Begib dich direkt dorthin. Gehe nicht \xC3\xBCber LOS. Ziehe nicht DM 4000,- ein.") do |card, card_stack, player, other_players, playing_field|
      playing_field.go_to_jail(player)
    end,
    Card.new("R\xC3\xBCcke vor bis zum Opernplatz. Wenn du \xC3\xBCber LOS kommst, ziehe DM 4000,- ein.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(26))
    end,
    Card.new("R\xC3\xBCcke vor bis zur Seestra\xC3\x9fe. Wenn du \xC3\xBCber LOS kommst, ziehe DM 4000,- ein.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(12))
    end,
    Card.new("Gehe 3 Felder zur\xC3\xBCck.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_dice_value(player, -3)
    end,
    Card.new("Die Bank Zahlt Dir eine Dividende: DM 1000,-") do |card, card_stack, player, other_players, playing_field|
      player.raise_money(1000)
    end,
    Card.new("Du bist zum Vorstand gew\xC3\xA4hlt worden. Zahle jedem Spieler DM 1000,-") do |card, card_stack, player, other_players, playing_field|
      other_players.each { |other_player| player.transfer_money_to(other_player, 1000)}
    end,
    Card.new("R\xC3\xBCcke vor bis auf LOS.") do |card, card_stack, player, other_players, playing_field|
      playing_field.player_move_to(player, playing_field.field(1))
    end,
    Card.new("Zahle eine Strafe von DM 200,- oder nimm eine Gemeinschaftskarte.") do |card, card_stack, player, other_players, playing_field|
      player.transfer_money_to(:bank, 200)
      # FIXME choise
    end,
    Card.new("Du kommst aus dem Gef\xC3\xA4ngnis frei. Diese Karte musst Du behalten, bis Du sie ben\xC3\xB6tigst oder verkaufst.") do |card, card_stack, player, other_players, playing_field|
      player.add_jail_card(card, card_stack)
    end
  ])
end
