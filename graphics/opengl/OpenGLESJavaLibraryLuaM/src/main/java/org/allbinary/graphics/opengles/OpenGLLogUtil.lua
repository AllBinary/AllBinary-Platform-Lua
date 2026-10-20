-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local OpenGLStrings = require("org.allbinary.image.opengles.OpenGLStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local OpenGLLogUtil = {}
OpenGLLogUtil.__index = OpenGLLogUtil
OpenGLLogUtil.className = "OpenGLLogUtil"

function OpenGLLogUtil:_init_fields()
    self.MAX_TEXTURE = " Max Texture Size: "
    self.LOG_ERROR = "logError"
    self.IMAGE = " Image: "
end

function OpenGLLogUtil.new()
    local self = setmetatable({}, OpenGLLogUtil)
    self:_init_fields()
    return self
end


function OpenGLLogUtil.getInstance()
        return OpenGLLogUtil.instance
end


function OpenGLLogUtil:logError(gl)
        local error = gl:glGetError()
        if error ~= self.GL10.GL_NO_ERROR then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(OpenGLStrings.getInstance().GL_ERROR_LABEL)
            stringBuffer:appendint(error)
            if error == 1281 then
                stringBuffer:append(self.MAX_TEXTURE)
                local maxTextureSize = java_new_array(0, 1)
                gl:glGetIntegerv(self.GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0)
                stringBuffer:appendint(maxTextureSize[1])
            end
            if error == 1280 then
                PreLogUtil.put(tostring(stringBuffer), self, OpenGLStrings.getInstance().SET)
            else
                ForcedLogUtil.log(tostring(stringBuffer), self)
            end
        end
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLLogUtil:logError(gl, image)
        local error = gl:glGetError()
        if error ~= self.GL10.GL_NO_ERROR then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(OpenGLStrings.getInstance().GL_ERROR_LABEL)
            stringBuffer:appendint(error)
            if error == 1281 then
                stringBuffer:append(self.MAX_TEXTURE)
                local maxTextureSize = java_new_array(0, 1)
                gl:glGetIntegerv(self.GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0)
                stringBuffer:appendint(maxTextureSize[1])
            end
            stringBuffer:append(self.IMAGE)
            stringBuffer:append(tostring(image))
            PreLogUtil.put(tostring(stringBuffer), self, self.LOG_ERROR)
        end
end

OpenGLLogUtil.instance = OpenGLLogUtil.new()

return OpenGLLogUtil

