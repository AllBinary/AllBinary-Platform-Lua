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
-- package org.allbinary.game.init

local GameInitializationUtil = {}
package.loaded["org.allbinary.game.init.GameInitializationUtil"] = GameInitializationUtil

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

local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameInitializedEvent = java_lazy("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = java_lazy("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local ResourceLoadingLevelFactory = java_lazy("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicBuildGameInitializerFactory = java_lazy("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local GameInitializationInterface = java_lazy("org.allbinary.game.init.GameInitializationInterface")

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

-- class table GameInitializationUtil is declared before the requires
GameInitializationUtil.__index = GameInitializationUtil
GameInitializationUtil.className = "GameInitializationUtil"
GameInitializationUtil.javaClassName = "org.allbinary.game.init.GameInitializationUtil"

function GameInitializationUtil:_init_fields()
    self.EVENT = GameInitializedEvent.new(self)
end

function GameInitializationUtil._jinit(self)
    GameInitializationUtil._init_fields(self)
    return self
end

function GameInitializationUtil.new()
    return GameInitializationUtil._jinit(setmetatable({}, GameInitializationUtil))
end


-- throws Exception
function GameInitializationUtil:initDemo(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        if ChangedGameFeatureListener.getInstance():isChangedFeature(mainFeatureFactory.STATIC) then
            local gameInitializationInterface = gameInitializationInterfaceFactoryInterface:getInstance()
            local features = Features.getInstance()
            if features:isFeature(mainFeatureFactory.LOAD_ALL) then
                self:initGame(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
            elseif features:isFeature(mainFeatureFactory.LOAD_ONDEMAND) then
                local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
                gameInitializationInterface:init(abeClientInformation, canvas:getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_EARLY:getLevel())
                self.EVENT:setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_EARLY)
            else
                error(require("java.lang.Exception").new("No Loading Feature Available"), 0)
            end
            GameInitializedEventHandler.getInstance():fireEvent(self.EVENT)
        end
end


-- throws Exception
function GameInitializationUtil:initGame(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
        if ChangedGameFeatureListener.getInstance():isChangedFeature(MainFeatureFactory.getInstance().STATIC) then
            local gameInitializationInterface = gameInitializationInterfaceFactoryInterface:getInstance()
            local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
            gameInitializationInterface:init(abeClientInformation, canvas:getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_ALL:getLevel())
            self.EVENT:setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_ALL)
            GameInitializedEventHandler.getInstance():fireEvent(self.EVENT)
            ChangedGameFeatureListener.getInstance():remove(MainFeatureFactory.getInstance().STATIC)
        end
end


function GameInitializationUtil.getInstance()
        return GameInitializationUtil.instance_f
end

GameInitializationUtil.instance_f = GameInitializationUtil.new()

return GameInitializationUtil

