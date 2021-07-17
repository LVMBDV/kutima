# frozen_string_literal: true

require 'rails_helper'

describe HealthCheckerJob, type: :job do
  describe '#perform_later' do
    subject do
      HealthCheckerJob.perform_later('TEST')
    end

    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it 'successfully enqueues' do
      expect { subject }.to have_enqueued_job
    end

    it 'successfully enqueues on default queue' do
      expect { subject }.to have_enqueued_job.on_queue(:default)
    end

    it 'successfully enqueues with arguments provided' do
      expect { subject }.to have_enqueued_job.with('TEST')
    end
  end
end
