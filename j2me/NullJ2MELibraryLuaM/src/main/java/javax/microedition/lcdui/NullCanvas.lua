-- Generated Code Do Not Modify
-- package javax.microedition.lcdui

-- local Stack = require("java.util.Stack")
local Canvas = require("javax.microedition.lcdui.Canvas")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullCanvas = {}
NullCanvas.__index = NullCanvas
NullCanvas.className = "NullCanvas"
setmetatable(NullCanvas, {__index = Canvas})


function NullCanvas.new()
    local self = setmetatable(Canvas.new(), NullCanvas)
    return self
end


function NullCanvas:setFullScreenMode(mode)
end


function NullCanvas:sizeChanged(w, h)
end


function NullCanvas:getCommandStack()
        error(java_exception("RuntimeException"), 0)
end


function NullCanvas:isCommand(command)
        error(java_exception("RuntimeException"), 0)
end


function NullCanvas:addCommand(command)
end


function NullCanvas:removeCommand(command)
end


function NullCanvas:removeAllCommands()
end


function NullCanvas:setCommandListener(l)
end


function NullCanvas:getCustomCommandListener()
        error(java_exception("RuntimeException"), 0)
end


function NullCanvas:isPaused()
        error(java_exception("RuntimeException"), 0)
end


function NullCanvas:removePauseCommand()
end


function NullCanvas:pause()
end


function NullCanvas:unPause()
end


-- throws Exception
function NullCanvas:process()
end


function NullCanvas:paint(graphics)
end


function NullCanvas:destroy()
end


function NullCanvas:setPaused(isPaused)
        error(java_exception("RuntimeException"), 0)
end


function NullCanvas:pointerDragged(x, y)
end


function NullCanvas:pointerPressed(x, y)
end


function NullCanvas:pointerReleased(x, y)
end

NullCanvas.NULL_CANVAS = NullCanvas.new()

return NullCanvas

