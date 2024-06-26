

local scene = GetScene()

runProcess(function()
  SetProfilerEnabled(false) -- have a bit more screen space
  scene.Clear()
  ClearWorld()
  LoadModel(script_dir() .. "content/level.wiscene")
  local path = RenderPath3D()
  application.SetActivePath(path)

  cam_entity = scene.Entity_FindByName("camera") -- query the from scene
  cam_component = scene.Component_GetCamera(cam_entity)
  transform = scene.Component_GetTransform(cam_entity) -- get camera's transform
  GetCamera().TransformCamera(transform) -- Transform the main camera with transform that you got from camera in the scene

  -- backlog_post("/////////////////////////////////////");
  -- backlog_post("///",os.time());
  -- backlog_post("/////////////////////////////////////");
  --local camera = GetCamera()
  while true do
    --local camera = GetCamera()
    --camera.UpdateCamera()
    update()
    --backlog_post("///",os.time());
    if(not backlog_isactive() and input.Press(string.byte('R'))) then
      -- reload script
      backlog_post("RELOAD", os.time())
      killProcesses()
      --application.SetActivePath(prevPath)
      dofile(script_dir() .. "game.lua")
      return
		end
  end
end)