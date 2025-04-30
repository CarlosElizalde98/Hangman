require_relative "lib/game_controller"

Dir.mkdir('saves') unless Dir.exist?('saves')

game = Game.new()

game.game_round()