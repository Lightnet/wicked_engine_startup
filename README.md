# wicked_engine_startup

# licnese: MIT

# Created By: Lightnet

# Game Engine:
 * WickedEngine - https://github.com/turanszkij/WickedEngine

# Information:
  Simple startup.lua to run without editor.

  The setup scene example for camera, cube and direct lighting. With the camera rotate off a bit.

  Took time to get it working. Docs example for WickedEngine.

  There are layers. One is the 2D and 3D render. By default UI editor layer render2D.

  3D is empty scene.

  Think of node tree since it entity component system.
```
-Wicked Engine
--API
--Render 3D
--Render 2D
```
  You can think of Godot Engine, Bevy Engine, Unreal Egnine and other things relate how they handle objects and components.

  One reason is reduce repeat scripting or looping them.

  The other reason user can custm how script is handle. But there limited to API. One is socket is not support in 0.71.422. 
  
  Since the person is one man team work on Wicked Engine.

# method 1:
startup.lua:
```lua
runProcess(function()
  -- Wait for Engine update tick
  update()--this is need to update
  dofile(script_dir() .. "game.lua")
end)
```
  You can use this to load and test.

# method 2:
startup.lua
```lua
runProcess(function()
  -- Wait for Engine update tick
  update()--this is need to update 
  local path = RenderPath3D()--new render
  application.SetActivePath(path)--set render
end)
```
  Run empty render scene.

# debug test:
startup.lua
```lua
local scene = GetScene()

runProcess(function()
  --get current render editor
  local prevPath = application.GetActivePath()
  --new render
  local path = RenderPath3D()
  application.SetActivePath(path)

  while true do
    update()
    if(not backlog_isactive() then
      if input.Press(KEYBOARD_BUTTON_ESCAPE) then
        --render to ui editor
        application.SetActivePath(prevPath)
        killProcesses()
      end
    end
  end
end)
```
  Run empty scene and render. Escape key to return to editor.