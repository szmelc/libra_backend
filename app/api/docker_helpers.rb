module DockerHelpers
  def container_running?(name)
    system("docker inspect -f '{{.State.Running}}' #{name}") ? true : false
  end
end
