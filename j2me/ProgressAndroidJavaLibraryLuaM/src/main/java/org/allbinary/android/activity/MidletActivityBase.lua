-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.android.activity

local Activity = require("android.app.Activity")
local MotionEvent = require("android.view.MotionEvent")
local View = require("android.view.View")
local GenericMotionEventVerifyInterface = require("org.allbinary.android.GenericMotionEventVerifyInterface")
local GameFeatureEvent = require("org.allbinary.game.configuration.event.GameFeatureEvent")
local GameFeatureListenerInterface = require("org.allbinary.game.configuration.event.GameFeatureListenerInterface")
local GameInitializedEvent = require("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedListenerInterface = require("org.allbinary.game.configuration.event.GameInitializedListenerInterface")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local SimpleProgressActivityInterface = require("org.allbinary.android.activity.SimpleProgressActivityInterface")
local KeyInputViewCompositeInterface = require("org.allbinary.android.activity.KeyInputViewCompositeInterface")

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

local MidletActivityBase = {}
MidletActivityBase.__index = MidletActivityBase
MidletActivityBase.className = "MidletActivityBase"
setmetatable(MidletActivityBase, {__index = Activity})

function MidletActivityBase.new()
    local self = setmetatable(Activity.new(), MidletActivityBase)
    return self
end


function MidletActivityBase:onGameFeatureChange(gameFeatureEvent)
end


function MidletActivityBase:onEvent(eventObject)
end


function MidletActivityBase:onGameInitialized(gameInitializedEvent)
end


-- throws Exception
function MidletActivityBase:onSetProgress(value, text)
end


-- throws Exception
function MidletActivityBase:onDismissProgress(animationSequence)
end


-- throws Exception
function MidletActivityBase:onShowProgress(indeterminate, animationSequence)
end


function MidletActivityBase:getRootView()
        error(java_exception("RuntimeException"), 0)
end


function MidletActivityBase:getView()
        error(java_exception("RuntimeException"), 0)
end


function MidletActivityBase:setKeyInputView(keyInputView)
end


function MidletActivityBase:onGenericMotionEvent(event)
        error(java_exception("RuntimeException"), 0)
end

return MidletActivityBase

