require "rspec"
require_relative "app/Cell"

describe Cell do
  subject(:cell) { Cell.new }

  it { should respond_to(:x) }
  it { should respond_to(:y) }
  it { should respond_to(:state) }

  describe "#initialize" do

    context("Instance with arguments") do
      let!(:cell_for_test){ Cell.new(1, 1, true) }

      it "Sets X position" do
        expect(cell_for_test.x).to eq 1
      end

      it "Sets Y position" do
        expect(cell_for_test.y).to eq 1
      end

      it "Sets cell STATE" do
        expect(cell_for_test.state).to eq true
      end
    end

    context("Instance without arguments") do
      let!(:cell_for_test){ Cell.new }

      it "Sets X position to 0" do
        expect(cell_for_test.x).to eq 0
      end

      it "Sets Y position to 0" do
        expect(cell_for_test.y).to eq 0
      end

      it "Sets cell STATE to false" do
        expect(cell_for_test.state).to eq false
      end
    end

  end

  describe "Operations with a cell" do
    let!(:cell_for_test){ Cell.new(1, 1, true) }

    describe "STATE for the cell" do
      context "When cell is alive" do
        describe "#isAlive" do
          it 'Returns true' do
            expect(cell_for_test.isAlive).to eq true
          end
        end

        describe "#isDead" do
          it 'Returns false' do
            expect(cell_for_test.isDead).to eq false
          end
        end
      end

      context "When cell is dead" do
        before { cell_for_test.state = false }
        describe "#isAlive" do
          it 'Returns false' do
            expect(cell_for_test.isAlive).to eq false
          end
        end

        describe "#isDead" do
          it 'Returns true' do
            expect(cell_for_test.isDead).to eq true
          end
        end
      end
    end

    describe "Kill the cell" do
      it "Is possible" do
        expect(cell_for_test.killCell).to eq false
      end
    end

    describe "Born the cell" do
      it "Is possible" do
        expect(cell_for_test.bornCell).to eq true
      end
    end
  end

end
