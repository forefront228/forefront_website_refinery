Dragonfly.app.configure do
  plugin :imagemagick, identify_command: "identify -limit memory 0 -limit map 0"
end
