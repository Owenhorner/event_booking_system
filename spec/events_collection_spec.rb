require 'spec_helper'
require 'events_collection'

RSpec.describe EventsCollection do
  let(:events_collection) { EventsCollection.new(already_booked, available) }

  describe "#filter_available_events" do
    describe 'scenario 1' do
      let(:already_booked) do
        [
          Event.new(start_datetime: "2018-12-19 16:00:00", end_datetime: "2018-12-19 17:00:00"),
          Event.new(start_datetime: "2018-12-20 9:00:00", end_datetime: "2018-12-20 10:00:00"),
          Event.new(start_datetime: "2018-12-21 13:00:00", end_datetime: "2018-12-21 13:30:00")
        ]
      end
      let(:free_event) do
        Event.new(start_datetime: "2018-12-29 13:00:00", end_datetime: "2018-12-29 14:00:00")
      end
      let(:available) do
        [
          Event.new(start_datetime: "2018-12-19 16:00:00", end_datetime: "2018-12-19 17:00:00"),
          Event.new(start_datetime: "2018-12-20 9:30:00", end_datetime: "2018-12-20 11:30:00"),
          Event.new(start_datetime: "2018-12-28 13:00:00", end_datetime: "2018-12-28 15:00:00"),
          free_event
        ]
      end

      it "returns only available time slots" do
        expect(events_collection.filter_available_events).to eq([free_event])
      end
    end

    describe 'scenario_2' do
      let(:already_booked) do
        [
          Event.new(start_datetime: "2018-12-19 16:00:00", end_datetime: "2018-12-19 17:00:00"),
          Event.new(start_datetime: "2018-12-20 9:00:00", end_datetime: "2018-12-20 10:00:00")
        ]
      end
      let(:free_event) do
        Event.new(start_datetime: "2018-12-21 9:00:00", end_datetime: "2018-12-21 11:00:00")
      end
      let(:available) do
        [
          Event.new(start_datetime: "2018-12-19 16:00:00", end_datetime: "2018-12-19 17:00:00"),
          Event.new(start_datetime: "2018-12-20 9:30:00", end_datetime: "2018-12-20 11:30:00"),
          free_event
        ]
      end
      
      it "returns only available time slots" do
        expect(events_collection.filter_available_events).to eq([free_event])
      end
    end
  end
end
