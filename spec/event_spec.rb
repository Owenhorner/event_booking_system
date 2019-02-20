require 'spec_helper'
require 'event'

RSpec.describe Event do
  let(:event) { Event.new(start_datetime: "2018-12-21 9:00:00", end_datetime: "2018-12-20 11:00:00") }
  describe '#clash?' do
    context 'events are the same time' do
      let(:clashing_event) { Event.new(start_datetime: "2018-12-21 9:00:00", end_datetime: "2018-12-21 11:00:00") }

      it 'returns true' do
        expect(event.clash?(clashing_event)).to eq(true)
      end
    end

    context 'events overlap' do
      let(:overlapping_event) { Event.new(start_datetime: "2018-12-21 8:00:00", end_datetime: "2018-12-21 10:00:00") }

      it 'returns true' do
        expect(event.clash?(overlapping_event)).to eq(true)
      end
    end

    context 'events do not overlap' do
      let(:valid_event) { Event.new(start_datetime: "2018-12-22 9:00:00", end_datetime: "2018-12-22 11:00:00") }

      it 'returns false' do
        expect(event.clash?(valid_event)).to eq(false)
      end
    end
  end

  describe '#start_time' do
    it 'returns an integer that represents start time' do
      expect(event.start_time).to eq(90000)
    end
  end

  describe '#end_time' do
    it 'returns an integer that represents end time' do
      expect(event.end_time).to eq(110000)
    end
  end
end
