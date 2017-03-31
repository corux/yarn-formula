require 'serverspec'

set :backend, :exec

describe command("yarn") do
  its(:exit_status) { should eq 0 }
end
