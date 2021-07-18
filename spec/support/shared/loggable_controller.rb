# frozen_string_literal: true

shared_examples 'an endpoint that logs events' do |method, path, headers: {}|
  # rubocop:disable RSpec/ExampleLength - violation due to parameters
  it 'logs an event with level, name, and relevant controller/request data' do
    allow(EventLogger::Log).to receive(:call)
    # rubocop:disable RSpec/MessageSpies
    expect(EventLogger::Log).to receive(:call).with(anything,
                                                    anything,
                                                    hash_including(
                                                      {
                                                        action: /./,
                                                        controller: /./,
                                                        method: /./,
                                                        parameters: /./,
                                                        path: /./,
                                                        remote_ip: /./
                                                      }
                                                    ))
    # rubocop:enable RSpec/MessageSpies

    send(method, send(path, headers))
  end
  # rubocop:enable RSpec/ExampleLength
end
