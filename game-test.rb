require "rspec"
require_relative "Cell"
require_relative "Board"
require_relative "Game"

describe Game do

  subject(:game_for_test) { Game.new }

  it { should respond_to(:board) }
  it { should respond_to(:generation) }
  it { should respond_to(:total_generations) }

  describe "#initialize" do
    let(:board_for_test){ Board.new }
    let(:custom_board_for_test){ Board.new(5, 5) }
    let(:seed_for_test){ [[1,0],[1,1],[2,2]] }

    context "Instance with arguments COLUMNS and ROWS" do
      it "Assigns it correctly" do
        game = Game.new(custom_board_for_test)
        expect(game.board).to eq custom_board_for_test
      end
    end

    context "Instance with SEED" do
      it "Seeds the board" do
        game = Game.new(board_for_test, seed_for_test)
        seed_for_test.each do |row|
          expect(game.board.grid[row[0]][row[1]].state).to eq true
        end
      end
    end

    context "Verifying count" do
      it "Should still count live cells correctly" do
        game = Game.new(board_for_test, seed_for_test)
        expect(game.board.live_cells.count).to eq 3
      end

      it "Should still count dead cells correctly" do
        game = Game.new(board_for_test, seed_for_test)
        expect(game.board.dead_cells.count).to eq 6
      end
    end

  end

  describe "Given a board" do
    let(:board_for_test) { Board.new }

    describe "And send a seed" do
      let(:seed_for_test) { [[0,1],[1,0],[1,1],[2,2]] }

      describe "And a game with the previous" do
        let(:game_for_test) { Game.new(board_for_test, seed_for_test) }

        describe "After a generation" do
          it "Should have six live cells" do
            game_for_test.nextGeneration
            expect(game_for_test.board.live_cells.count).to eq 6
          end
        end

      end
    end
  end

end
