# frozen_string_literal: true

require 'rails_helper'

describe EventLogger::Log do
  describe '#call' do
    context 'when valid logger level and event are provided' do
      it 'should return true' do
        expect(EventLogger::Log.call(:debug, 'testing.event', test: 'TEST')).to be_truthy
      end
    end

    context 'when non-whitelisted logger level is provided' do
      it 'should raise an exception' do
        expect do
          EventLogger::Log.call(:invalid, 'testing.event', test: 'TEST')
        end.to raise_exception(EventLogger::InvalidLoggerLevel)
      end
    end

    context 'when an unregistered event is provided' do
      it 'should raise an exception' do
        expect do
          EventLogger::Log.call(:debug, 'unregistered.event', test: 'TEST')
        end.to raise_exception(EventLogger::UnregisteredEvent)
      end
    end
  end
end
