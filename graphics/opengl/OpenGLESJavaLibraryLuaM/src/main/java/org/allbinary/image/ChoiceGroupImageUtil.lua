--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.image

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local ChoiceGroupImageFactory = require("javax.microedition.lcdui.ChoiceGroupImageFactory")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ChoiceGroupImageUtil = {}
ChoiceGroupImageUtil.__index = ChoiceGroupImageUtil
ChoiceGroupImageUtil.className = "ChoiceGroupImageUtil"

function ChoiceGroupImageUtil.new()
    local self = setmetatable({}, ChoiceGroupImageUtil)
    return self
end


function ChoiceGroupImageUtil.getInstance()
        return ChoiceGroupImageUtil.instance
end


function ChoiceGroupImageUtil:init()
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                imageArray[index + 1] = preResourceImageUtil:encapsulate(imageArray[index + 1])
            end
            choiceGroupFactory:init(imageArray)
        end
end


function ChoiceGroupImageUtil:update(gl)
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                preResourceImageUtil:updateGL(gl, imageArray[index + 1])
            end
        end
        choiceGroupFactory:init(imageArray)
end


-- Java overloaded method: Lua keeps the last definition
function ChoiceGroupImageUtil:update(graphics)
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                preResourceImageUtil:update(graphics, imageArray[index + 1])
            end
        end
        choiceGroupFactory:init(imageArray)
end

ChoiceGroupImageUtil.instance = ChoiceGroupImageUtil.new()

return ChoiceGroupImageUtil

