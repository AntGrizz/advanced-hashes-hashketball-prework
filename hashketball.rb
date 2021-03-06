# Write your code here!
require "pry"

def game_hash
  game = {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  if game_hash[:home][:players].has_key?(player)
    game_hash[:home][:players][player][:points]
  elsif game_hash[:away][:players].has_key?(player)
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].has_key?(player)
    game_hash[:home][:players][player][:shoe]
  elsif game_hash[:away][:players].has_key?(player)
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home].has_value?(team)
    game_hash[:home][:colors]
  elsif game_hash[:away].has_value?(team)
    game_hash[:away][:colors]
  end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

def player_numbers(team)
  if game_hash[:home][:team_name] == team
    players_data = game_hash[:home][:players]
  elsif game_hash[:away][:team_name] == team
    players_data = game_hash[:away][:players]
end
players_data.collect do | key, value |
  value[:number]
end
end

def player_stats(name)
  if game_hash[:home][:players].has_key?(name)
    game_hash[:home][:players][name]
  elsif game_hash[:away][:players].has_key?(name)
    game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  shoe_size = nil
  player_name = ""
  game_hash.each do |key,data|
    data[:players].each do |player, stats|
      if shoe_size == nil || stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        player_name = player
      end
    end
  end
  game_hash[:home][:players][player_name][:rebounds] || game_hash[:away][:players][player_name][:rebounds]
end
