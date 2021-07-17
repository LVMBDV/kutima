# frozen_string_literal: true

shared_examples 'an endpoint that logs events' do |method, path, headers: {}|
  it 'logs an event with level, name, and relevant controller/request data' do
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

    send(method, send(path, headers))
  end
end
