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
-- package org.allbinary.graphics.opengles.renderer

local AllBinaryRendererBase3 = {}
package.loaded["org.allbinary.graphics.opengles.renderer.AllBinaryRendererBase3"] = AllBinaryRendererBase3

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

local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Image = java_lazy("javax.microedition.lcdui.Image")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
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

-- class table AllBinaryRendererBase3 is declared before the requires
AllBinaryRendererBase3.__index = AllBinaryRendererBase3
AllBinaryRendererBase3.className = "AllBinaryRendererBase3"
AllBinaryRendererBase3.javaClassName = "org.allbinary.graphics.opengles.renderer.AllBinaryRendererBase3"

function AllBinaryRendererBase3:_init_fields()
    self.list = BasicArrayListD.new()
end

function AllBinaryRendererBase3._jinit(self)
    AllBinaryRendererBase3._init_fields(self)
    return self
end

function AllBinaryRendererBase3.new()
    return AllBinaryRendererBase3._jinit(setmetatable({}, AllBinaryRendererBase3))
end


-- throws Exception
function AllBinaryRendererBase3:update(gl)
        while self.list:size() > 0 do
            local openGLESImage = self.list:removeAt(0)
            if not rawequal(openGLESImage, nil) then
                openGLESImage:set(gl)
            end
        end
end


function AllBinaryRendererBase3:add(image)
        self.list:add(image)
end

return AllBinaryRendererBase3

