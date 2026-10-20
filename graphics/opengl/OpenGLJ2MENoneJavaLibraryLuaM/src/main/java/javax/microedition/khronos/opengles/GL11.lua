-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

local GL10 = require("javax.microedition.khronos.opengles.GL10")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local GL11 = {}
GL11.__index = GL11
GL11.className = "GL11"
setmetatable(GL11, {__index = GL10})

return GL11

