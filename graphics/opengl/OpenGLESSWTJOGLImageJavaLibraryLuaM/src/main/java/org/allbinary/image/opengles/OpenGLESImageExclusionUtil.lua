-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.image.opengles

local OpenGLESImageExclusionUtil = {}
package.loaded["org.allbinary.image.opengles.OpenGLESImageExclusionUtil"] = OpenGLESImageExclusionUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Image = java_lazy("javax.microedition.lcdui.Image")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table OpenGLESImageExclusionUtil is declared before the requires
OpenGLESImageExclusionUtil.__index = OpenGLESImageExclusionUtil
OpenGLESImageExclusionUtil.className = "OpenGLESImageExclusionUtil"
OpenGLESImageExclusionUtil.javaClassName = "org.allbinary.image.opengles.OpenGLESImageExclusionUtil"

function OpenGLESImageExclusionUtil:_init_fields()
    self.EXCLUSION = "font"
    self.list = BasicArrayListD.new()
end


function OpenGLESImageExclusionUtil.getInstance()
        return OpenGLESImageExclusionUtil.instance_f
end


function OpenGLESImageExclusionUtil._jinit(self)
    OpenGLESImageExclusionUtil._init_fields(self)
    return self
end

function OpenGLESImageExclusionUtil.new(...)
    local self = setmetatable({}, OpenGLESImageExclusionUtil)
    OpenGLESImageExclusionUtil._jinit(self, ...)
    return self
end


function OpenGLESImageExclusionUtil:isCustomScaling(image)
        local imageName = image:getName()
        local isNormalScaling = rawequal(self.list:size(), 0) or (string.sub(imageName, 1, #self.EXCLUSION) == self.EXCLUSION)
        if isNormalScaling then
            return false
        else
            local size = self.list:size()
            local name = nil
            for index = 0, size - 1 do
                name = self.list:get(index)
                if (string.sub(imageName, 1, #name) == name) then
                    isNormalScaling = true
                end
            end
        end
        if isNormalScaling then
            return false
        else
            return true
        end
end

OpenGLESImageExclusionUtil.instance_f = OpenGLESImageExclusionUtil.new()

return OpenGLESImageExclusionUtil

