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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryRendererBase3 = {}
AllBinaryRendererBase3.__index = AllBinaryRendererBase3
AllBinaryRendererBase3.className = "AllBinaryRendererBase3"

function AllBinaryRendererBase3:_init_fields()
    self.list = BasicArrayListD.new()
end

function AllBinaryRendererBase3.new()
    local self = setmetatable({}, AllBinaryRendererBase3)
    self:_init_fields()
    return self
end


-- throws Exception
function AllBinaryRendererBase3:update(gl)
        while self.list:size() > 0 do
            local openGLESImage = self.list:removeAt(0)
            if openGLESImage ~= nil then
                openGLESImage:set(gl)
            end
        end
end


function AllBinaryRendererBase3:add(image)
        self.list:add(image)
end

return AllBinaryRendererBase3

