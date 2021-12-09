# frozen_string_literal: true

require 'test_helper'

class MessageDispatchingServerTest < Minitest::Test
  def setup
    @server = RhcCloudConnectorWorker::MessageDispatchingServer.new
    @message = Yggdrasil::Data.new(
      directive: 'foreman_rh_cloud',
      message_id: 'fb25d5de-b61d-480a-984b-81d5574b2de5',
      metadata: {
        'operation' => 'run',
        'return_url' => 'https://cloud.redhat.com/api/v1/ingres/upload',
        'correlation_id' => '6684b9dd-0d16-42c1-b13a-9f45be59e3b6',
        'playbook_run_name' => 'Human-readable playbook run name',
        'playbook_run_url' => 'https://console.redhat.com/insights/remediations/1234',
        'sat_id' => 'aa3b1faa-56f3-4d14-8258-615d11e20060',
        'sat_org_id' => '12345',
        'initiator_user_id' => '4efca34c6d9ae05ef7c3d7a7424e6370d198159a841ae005084888a9a4529e27',
        'hosts' => '01.example.com,02.example.com',
        'response_interval' => '30',
        'response_full' => 'false'
      },
      content: 'https://cloud.redhat.com/api/v1/remediations/1234/playbook'
    )
  end

  def test_forwards_message_to_foreman
    RhcCloudConnectorWorker::Foreman.any_instance.expects(:pass).with { |metadata| metadata == @message.metadata }

    @server.send(@message, nil)
  end
end
