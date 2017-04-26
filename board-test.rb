require "rspec"
require_relative "Board"
require_relative "Cell"

describe Board do

  subject(:board_for_test) { Board.new }

  it { should respond_to(:columns) }
  it { should respond_to(:rows) }
  it { should respond_to(:cells) }
  it { should respond_to(:grid) }

  describe "#initialize" do
    context "Instance without arguments" do
      it "Default value for columns to 3" do
        expect(board_for_test.columns).to eq 3
      end

      it "Default value for rows to 3" do
        expect(board_for_test.columns).to eq 3
      end
    end
  end

  describe "Board" do
    it "Rows inside grid returns an array" do
      expect(board_for_test.grid.class).to eq Array
    end

    it "Columns inside grid returns an array" do
      board_for_test.grid.each do |row|
        expect(row.class).to eq Array
      end
    end

    it "Grid has cells" do
      board_for_test.grid.each do |row|
        row.each do |column|
          expect(column.class).to eq Cell
        end
      end
    end
  end

  describe "Cells" do
    it "Is an array" do
      expect(board_for_test.cells.class).to eq Array
    end

    it "Contains something" do
      expect(board_for_test.cells.length).to be > 0
    end

    it "Contents are cells" do
      board_for_test.cells.each do |cell|
        expect(cell.class).to eq Cell
      end
    end

    it "Contains dead cells" do
      board_for_test.cells.each do |cell|
        expect(cell.isAlive).to eq false
      end
    end
  end

  describe "Counting live cells" do
    context "Default value" do
      it "Returns zero" do
        expect(board_for_test.live_cells.count).to eq 0
      end
    end

    context "With a cell alive" do
      before { board_for_test.grid[1][1].state = true }
      it "Returns one" do
        expect(board_for_test.live_cells.count).to eq 1
      end
    end
  end

  describe "Counting dead cells" do
    context "Default value" do
      it "Returns nine" do
        expect(board_for_test.dead_cells.count).to eq 9
      end
    end

    context "With a cell dead" do
      before { board_for_test.grid[1][1].state = true }
      it "Returns eight" do
        expect(board_for_test.dead_cells.count).to eq 8
      end
    end
  end

  describe "Neighbors alive" do
    context "From at position middle of board"
    let(:cell_for_test) { board_for_test.grid[1][1] }

    it "Detects a neighbor alive up" do
      board_for_test.grid[cell_for_test.y - 1][cell_for_test.x].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive down" do
      board_for_test.grid[cell_for_test.y + 1][cell_for_test.x].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive left" do
      board_for_test.grid[cell_for_test.y][cell_for_test.x - 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive right" do
      board_for_test.grid[cell_for_test.y][cell_for_test.x + 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive up left" do
      board_for_test.grid[cell_for_test.y - 1][cell_for_test.x - 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive up right" do
      board_for_test.grid[cell_for_test.y - 1][cell_for_test.x + 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive down left" do
      board_for_test.grid[cell_for_test.y + 1][cell_for_test.x - 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "Detects a neighbor alive down right" do
      board_for_test.grid[cell_for_test.y + 1][cell_for_test.x + 1].state = true
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 1
    end

    it "No neighbors alive nearby" do
      expect(board_for_test.neighborsAlive(cell_for_test).count).to eq 0
    end
  end

  describe "Generate first generation" do
    before { board_for_test.generate }
    it 'Should not return an empty array' do
      expect(board_for_test.live_cells).to_not eq []
    end
  end

  describe "Counting cells alive and deads" do
    it "Returns total cells" do
      expect(board_for_test.live_cells.count + board_for_test.dead_cells.count).to eq board_for_test.cells.count
    end
  end
end
