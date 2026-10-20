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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local ResourceInitialization = require("org.allbinary.game.resource.ResourceInitialization")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BaseGameInitialization = require("org.allbinary.game.init.BaseGameInitialization")

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

local CommonGameInitialization = {}
CommonGameInitialization.__index = CommonGameInitialization
CommonGameInitialization.className = "CommonGameInitialization"
setmetatable(CommonGameInitialization, {__index = BaseGameInitialization})

function CommonGameInitialization:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end


function CommonGameInitialization.new(resourceInitializationArray, portion)
    local self = setmetatable(BaseGameInitialization.new(resourceInitializationArray, portion), CommonGameInitialization)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function CommonGameInitialization:init(abeClientInformation, commandListener, level)
        BaseGameInitialization.init(self, abeClientInformation, commandListener, level)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if not self:isGameInitialized() and level == resourceLoadingLevelFactory.LOAD_ALL:getLevel() then
            self:setGameInitialized(true)
            local progressCanvas = ProgressCanvasFactory.getInstance()
            SmallIntegerSingletonFactory.getInstance():init()
            progressCanvas:addNormalPortion(50, "Integers")
            PointFactory.getInstance():init()
            progressCanvas:addNormalPortion(50, "Points")
            AngleFactory.getInstance()
            progressCanvas:addNormalPortion(50, "Angles")
            self:initGame()
            self.resourceInitializationArray[self.GAME_RESOURCES + 1]:init()
        end
        BaseGameInitialization.resourceInitialization(self, level)
end


-- throws Exception
function CommonGameInitialization:initGame()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end

return CommonGameInitialization

