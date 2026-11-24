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
-- package org.allbinary.game.midlet

local DemoRunnable = {}
package.loaded["org.allbinary.game.midlet.DemoRunnable"] = DemoRunnable

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

local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Runnable = require("java.lang.Runnable")
local DemoGameMidlet = java_lazy("org.allbinary.game.midlet.DemoGameMidlet")
local DemoGameMidletEvent = java_lazy("org.allbinary.game.midlet.DemoGameMidletEvent")
local DemoGameMidletEventHandler = java_lazy("org.allbinary.game.midlet.DemoGameMidletEventHandler")
local DemoGameMidletStateFactory = java_lazy("org.allbinary.game.midlet.DemoGameMidletStateFactory")

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

-- class table DemoRunnable is declared before the requires
DemoRunnable.__index = DemoRunnable
DemoRunnable.className = "DemoRunnable"
DemoRunnable.javaClassName = "org.allbinary.game.midlet.DemoRunnable"
DemoRunnable.java_implements = " Runnable "
DemoRunnable.java_interfaces = function() return {Runnable} end

function DemoRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.demoGameMidlet == nil then self.demoGameMidlet = nil end
    if self.startDemoGameMidletEvent == nil then self.startDemoGameMidletEvent = nil end
end


function DemoRunnable._jinit(self, demoGameMidlet)
    DemoRunnable._init_fields(self)
        self.demoGameMidlet = demoGameMidlet
        self.startDemoGameMidletEvent = DemoGameMidletEvent.new(self.demoGameMidlet, DemoGameMidletStateFactory.getInstance().START_DEMO)
    return self
end

function DemoRunnable.new(...)
    local self = setmetatable({}, DemoRunnable)
    DemoRunnable._jinit(self, ...)
    return self
end


function DemoRunnable:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append("GameCanvasRunnableInterface")), self, self.commonStrings.RUN)
            self.demoGameMidlet:commandAction(MyCommandsFactory.getInstance().SET_DISPLAYABLE, ProgressCanvasFactory.getInstance())
            self.demoGameMidlet:setGameCanvasRunnableInterface(self.demoGameMidlet:createDemoGameCanvasRunnableInterface())
            self.demoGameMidlet:demoSetup()
            DemoGameMidletEventHandler.getInstance():fireEvent(self.startDemoGameMidletEvent)
            self.demoGameMidlet:startGameCanvasRunnableInterface()
            self.demoGameMidlet:postDemoSetup()
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return DemoRunnable

