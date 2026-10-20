-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

local GL = require("javax.microedition.khronos.opengles.GL")

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
local GL10 = {}
GL10.__index = GL10
GL10.className = "GL10"
setmetatable(GL10, {__index = GL})

return GL10

