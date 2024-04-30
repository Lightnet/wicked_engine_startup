
--killProcesses()

runProcess(function()
  -- Wait for Engine update tick
  update()--this is need to update 
  dofile(script_dir() .. "game.lua")
  --clear ui editor 
  --local path = RenderPath3D()
  --application.SetActivePath(path)
  --update()--nope
end)
