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
-- package org.allbinary.game.ag.layer.hud.basic.notification

local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoGameNotificationHudSingleton = {}
NoGameNotificationHudSingleton.__index = NoGameNotificationHudSingleton
NoGameNotificationHudSingleton.className = "NoGameNotificationHudSingleton"

function NoGameNotificationHudSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameNotificationHud = GameNotificationHud.NULL_GAME_NOTIFICATION
end


function NoGameNotificationHudSingleton.getInstance()
        return NoGameNotificationHudSingleton.instance
end


function NoGameNotificationHudSingleton.new()
    local self = setmetatable({}, NoGameNotificationHudSingleton)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local basicHudFactory = BasicHudFactory.getInstance()
            local NoGameGameNotificationHud = {}
            NoGameGameNotificationHud.__index = NoGameGameNotificationHud
            NoGameGameNotificationHud.className = "NoGameGameNotificationHud"
            setmetatable(NoGameGameNotificationHud, {__index = GameNotificationHud})
            

            function NoGameNotificationHudSingleton.new()
                local self = setmetatable(GameNotificationHud.new(self.basicHudFactory.TOPCENTER, self.basicHudFactory.HORIZONTAL, 2, BasicColorFactory.getInstance().RED), NoGameNotificationHudSingleton)
                    -- super(...) made self above
                    self.updateMaxWidth = 40
                    self.updateMaxHeight = 14
                return self
            end

            self.gameNotificationHud = NoGameGameNotificationHud.new()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function NoGameNotificationHudSingleton:getGameNotificationHud()
        return self.gameNotificationHud
end

NoGameNotificationHudSingleton.instance = NoGameNotificationHudSingleton.new()

return NoGameNotificationHudSingleton

