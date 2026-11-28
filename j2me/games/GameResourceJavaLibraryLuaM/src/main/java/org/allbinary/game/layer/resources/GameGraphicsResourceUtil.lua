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

local GameGraphicsResourceUtil = {}
package.loaded["org.allbinary.game.layer.resources.GameGraphicsResourceUtil"] = GameGraphicsResourceUtil

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GraphicsFeature = java_lazy("org.allbinary.game.configuration.feature.GraphicsFeature")
local GraphicsFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameGraphicsResourceUtil is declared before the requires
GameGraphicsResourceUtil.__index = GameGraphicsResourceUtil
GameGraphicsResourceUtil.className = "GameGraphicsResourceUtil"
GameGraphicsResourceUtil.javaClassName = "org.allbinary.game.layer.resources.GameGraphicsResourceUtil"

function GameGraphicsResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SPRITE = "_sprite"
    self.QUARTER = "_quarter"
    self.name_f = StringUtil.getInstance().EMPTY_STRING
end


function GameGraphicsResourceUtil.getInstance()
        if rawequal(GameGraphicsResourceUtil.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            GameGraphicsResourceUtil.instance_f = GameGraphicsResourceUtil.new()
        end
        return GameGraphicsResourceUtil.instance_f
end


function GameGraphicsResourceUtil._jinit(self)
    GameGraphicsResourceUtil._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.name_f = self:getString()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function GameGraphicsResourceUtil.new(...)
    local self = setmetatable({}, GameGraphicsResourceUtil)
    GameGraphicsResourceUtil._jinit(self, ...)
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
            if rawequal(graphicsFeature, graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS) or rawequal(graphicsFeature, graphicsFeatureFactory.IMAGE_ROTATION_ON_THE_FLY) then
            elseif rawequal(graphicsFeature, graphicsFeatureFactory.SPRITE_FULL_GRAPHICS) then
                stringBuffer:append(self.SPRITE)
            elseif rawequal(graphicsFeature, graphicsFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS) then
                stringBuffer:append(self.QUARTER)
                stringBuffer:append(self.SPRITE)
            else
                error(require("java.lang.Exception").new("None/Unknown Sub Image Resource Type Specified"), 0)
            end
        elseif OpenGLFeatureUtil.getInstance():isAnyThreed() then
            stringBuffer:append(CanvasStrings.getInstance().OBJ_MODEL)
        else
            error(require("java.lang.Exception").new("None/Unknown Main Image Resource Type Specified"), 0)
        end
        return tostring(stringBuffer)
end


function GameGraphicsResourceUtil:getName()
        return self.name_f
end

GameGraphicsResourceUtil.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameGraphicsResourceUtil

