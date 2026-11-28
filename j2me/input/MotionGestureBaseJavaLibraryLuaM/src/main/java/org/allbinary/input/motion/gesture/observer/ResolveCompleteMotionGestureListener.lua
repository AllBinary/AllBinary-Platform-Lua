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
-- package org.allbinary.input.motion.gesture.observer

local ResolveCompleteMotionGestureListener = {}
package.loaded["org.allbinary.input.motion.gesture.observer.ResolveCompleteMotionGestureListener"] = ResolveCompleteMotionGestureListener

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

local CompleteMotionGestureInputEventHandler = java_lazy("org.allbinary.game.input.CompleteMotionGestureInputEventHandler")
local GameKeyCompleteMotionGestureInputEvent = java_lazy("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local GameKeyFromMotionGestureEventListener = java_lazy("org.allbinary.game.input.motion.action.GameKeyFromMotionGestureEventListener")
local MotionGestureToMotionGestureActionAssociation = java_lazy("org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation")
local MotionGestureConfiguration = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CompleteMotionGestureListenerInterface = require("org.allbinary.input.motion.gesture.observer.CompleteMotionGestureListenerInterface")

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

-- class table ResolveCompleteMotionGestureListener is declared before the requires
ResolveCompleteMotionGestureListener.__index = ResolveCompleteMotionGestureListener
ResolveCompleteMotionGestureListener.className = "ResolveCompleteMotionGestureListener"
ResolveCompleteMotionGestureListener.javaClassName = "org.allbinary.input.motion.gesture.observer.ResolveCompleteMotionGestureListener"
ResolveCompleteMotionGestureListener.java_implements = " CompleteMotionGestureListenerInterface "
ResolveCompleteMotionGestureListener.java_interfaces = function() return {CompleteMotionGestureListenerInterface} end

function ResolveCompleteMotionGestureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ResolveCompleteMotionGestureListener._jinit(self)
    ResolveCompleteMotionGestureListener._init_fields(self)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF("MotionGesture to CompleteMotionGesture Reciever", self, commonStrings.CONSTRUCTOR)
        CompleteMotionGestureInputEventHandler.getInstance():addListener(GameKeyFromMotionGestureEventListener.new())
    return self
end

function ResolveCompleteMotionGestureListener.new(...)
    local self = setmetatable({}, ResolveCompleteMotionGestureListener)
    ResolveCompleteMotionGestureListener._jinit(self, ...)
    return self
end


-- throws Exception
function ResolveCompleteMotionGestureListener:onMotionGestureCompleted(list)
        local configuration = MotionGestureConfigurationFactory.getInstance()
        local commandActionsList = configuration:getAssociateCommandActionsList()
        local size = commandActionsList:size()
        for index = size - 1, 0, -1 do
            local association = commandActionsList.objectArray[index + 1]
            if rawequal(association:isMotionGestureArrayEquals(list), true) then
                local completeMotionGestureInputEvent = association:getCommandAction()
                CompleteMotionGestureInputEventHandler.getInstance():fireEvent(completeMotionGestureInputEvent)
                break
            end
        end
end

return ResolveCompleteMotionGestureListener

