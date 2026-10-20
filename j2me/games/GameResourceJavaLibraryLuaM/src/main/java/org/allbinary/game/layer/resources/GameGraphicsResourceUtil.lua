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
-- package org.allbinary.game.layer.resources

local Features = require("org.allbinary.game.configuration.feature.Features")
local GraphicsFeature = require("org.allbinary.game.configuration.feature.GraphicsFeature")
local GraphicsFeatureFactory = require("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local GameGraphicsResourceUtil = {}
GameGraphicsResourceUtil.__index = GameGraphicsResourceUtil
GameGraphicsResourceUtil.className = "GameGraphicsResourceUtil"

function GameGraphicsResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SPRITE = "_sprite"
    self.QUARTER = "_quarter"
    self.name = StringUtil.getInstance().EMPTY_STRING
end


function GameGraphicsResourceUtil.getInstance()
        if GameGraphicsResourceUtil.instance == NullUtil.getInstance().NULL_OBJECT then
            GameGraphicsResourceUtil.instance = GameGraphicsResourceUtil.new()
        end
        return GameGraphicsResourceUtil.instance
end


function GameGraphicsResourceUtil.new()
    local self = setmetatable({}, GameGraphicsResourceUtil)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.name = self:getString()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end


-- throws Exception
function GameGraphicsResourceUtil:getString()
        local graphicsFeatureFactory = GraphicsFeatureFactory.getInstance()
        local graphicsFeature = graphicsFeatureFactory.NONE
        local features = Features.getInstance()
        if features:isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS) then
            graphicsFeature = graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS
        elseif features:isFeature(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS) then
            graphicsFeature = graphicsFeatureFactory.SPRITE_FULL_GRAPHICS
        elseif features:isFeature(graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS) then
            graphicsFeature = graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS
        elseif features:isFeature(graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY) then
            graphicsFeature = graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY
        end
        return self:getStringForFeature(graphicsFeature)
end


-- throws Exception
function GameGraphicsResourceUtil:getStringForFeature(graphicsFeature)
        local stringBuffer = StringMaker.new()
        local graphicsFeatureFactory = GraphicsFeatureFactory.getInstance()
        stringBuffer:delete(0, stringBuffer:length())
        local features = Features.getInstance()
        if features:isFeature(graphicsFeatureFactory.VECTOR_GRAPHICS) then
        elseif features:isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS) then
            if graphicsFeature == graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS or graphicsFeature == graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY then
            elseif graphicsFeature == graphicsFeatureFactory.SPRITE_FULL_GRAPHICS then
                stringBuffer:append(self.SPRITE)
            elseif graphicsFeature == graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS then
                stringBuffer:append(self.QUARTER)
                stringBuffer:append(self.SPRITE)
            else
                error(java_exception("Exception", "None/Unknown Sub Image Resource Type Specified"), 0)
            end
        elseif OpenGLFeatureUtil.getInstance():isAnyThreed() then
            stringBuffer:append(CanvasStrings.getInstance().OBJ_MODEL)
        else
            error(java_exception("Exception", "None/Unknown Main Image Resource Type Specified"), 0)
        end
        return tostring(stringBuffer)
end


function GameGraphicsResourceUtil:getName()
        return self.name
end

GameGraphicsResourceUtil.instance = NullUtil.getInstance().NULL_OBJECT

return GameGraphicsResourceUtil

