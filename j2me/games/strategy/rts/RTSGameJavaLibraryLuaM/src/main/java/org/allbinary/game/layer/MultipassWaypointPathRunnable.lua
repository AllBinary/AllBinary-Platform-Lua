-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local NullUtil = require("org.allbinary.logic.NullUtil")
local ARunnable = require("org.allbinary.thread.ARunnable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local MultipassState = require("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local WaypointPathRunnableBase = require("org.allbinary.game.layer.WaypointPathRunnableBase")

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

local MultipassWaypointPathRunnable = {}
MultipassWaypointPathRunnable.__index = MultipassWaypointPathRunnable
MultipassWaypointPathRunnable.className = "MultipassWaypointPathRunnable"
setmetatable(MultipassWaypointPathRunnable, {__index = WaypointPathRunnableBase})
local FirstRunnable = {}
    FirstRunnable.__index = FirstRunnable
    FirstRunnable.className = "FirstRunnable"
    setmetatable(FirstRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.FirstRunnable = FirstRunnable

    function FirstRunnable:_init_fields()
        self.multipassWaypointPathRunnable = nil
    end
    

    function MultipassWaypointPathRunnable.new(multipassWaypointPathRunnable)
        local self = setmetatable(ARunnable.new(), MultipassWaypointPathRunnable)
        self:_init_fields()
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end
    

    function MultipassWaypointPathRunnable:run()
            self.multipassWaypointPathRunnable:processFirstRunnable()
    end

--    private boolean first = true;
    local SecondRunnable = {}
    SecondRunnable.__index = SecondRunnable
    SecondRunnable.className = "SecondRunnable"
    setmetatable(SecondRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.SecondRunnable = SecondRunnable

    function SecondRunnable:_init_fields()
        self.multipassWaypointPathRunnable = nil
    end
    

    function MultipassWaypointPathRunnable.new(multipassWaypointPathRunnable)
        local self = setmetatable(ARunnable.new(), MultipassWaypointPathRunnable)
        self:_init_fields()
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end
    

    function MultipassWaypointPathRunnable:run()
            self.multipassWaypointPathRunnable:processSecondRunnable()
    end

local EndRunnable = {}
    EndRunnable.__index = EndRunnable
    EndRunnable.className = "EndRunnable"
    setmetatable(EndRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.EndRunnable = EndRunnable

    function EndRunnable:_init_fields()
        self.multipassWaypointPathRunnable = nil
    end
    

    function MultipassWaypointPathRunnable.new(multipassWaypointPathRunnable)
        local self = setmetatable(ARunnable.new(), MultipassWaypointPathRunnable)
        self:_init_fields()
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end
    

    function MultipassWaypointPathRunnable:run()
            self.multipassWaypointPathRunnable:processEndRunnable()
    end


function MultipassWaypointPathRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.multipassState = MultipassState.new()
    self.done = false
    self.list = self.basicArrayListUtil:getImmutableInstance()
    self.pathFindingInfo = NullUtil.getInstance().NULL_OBJECT
    self.FIRST_RUNNABLE = FirstRunnable.new(self)
    self.SECOND_RUNNABLE = SecondRunnable.new(self)
    self.END_RUNNABLE = EndRunnable.new(self)
    self.ALREADY_ENDED_RUNNABLE = (function()
        local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
        

        function o:run()
            error(java_exception("RuntimeException"), 0)
        end
        return o
    end)()
    self.currentPassRunnable = self.FIRST_RUNNABLE
end


function MultipassWaypointPathRunnable.new()
    local self = setmetatable(WaypointPathRunnableBase.new(), MultipassWaypointPathRunnable)
    self:_init_fields()
    return self
end


function MultipassWaypointPathRunnable:setRunning(isRunning)
        self.runningP = isRunning
        if self.runningP then
            self:reset()
            self.done = false
        end
end


function MultipassWaypointPathRunnable:run()
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            self.currentPassRunnable:run()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
        end
end


function MultipassWaypointPathRunnable:reset2()
        self.multipassState.step = 0
        self.multipassState.iteration = 0
        self.multipassState.iteration2 = 0
        self.pathFindingInfo = NullUtil.getInstance().NULL_OBJECT
end


function MultipassWaypointPathRunnable:finish()
        self:reset2()
        self.currentPassRunnable = self.ALREADY_ENDED_RUNNABLE
        self.done = true
end


function MultipassWaypointPathRunnable:isDone()
        return self.done
end


function MultipassWaypointPathRunnable:reset()
        self:reset2()
        self.currentPassRunnable = self.FIRST_RUNNABLE
        self.done = false
end


function MultipassWaypointPathRunnable:processFirstRunnable()
        local try_ok, try_error = pcall(function()
            self.pathFindingLayer:getWaypointRunnableLogHelper():start(self.pathFindingLayer)
            self:reset2()
            local geographicMapCellPosition = self.pathFindingLayer:getCurrentGeographicMapCellPosition()
            if geographicMapCellPosition == nil then
                error(java_exception("Exception", "Should never be running here"), 0)
            end
            self.pathFindingInfo = self.targetPathFindingLayer:getWaypointBehavior():getWaypoint():getPathFindingInfo(geographicMapCellPosition)
            local localPathFindingInfo = self.pathFindingInfo
            self.list = self.targetPathFindingLayer:getWaypointBehavior():getWaypoint():getPathsList(geographicMapCellPosition, localPathFindingInfo, self.multipassState)
            if self.list ~= self.basicArrayListUtil:getImmutableInstance() then
                self.END_RUNNABLE:run()
            else
                self.currentPassRunnable = self.SECOND_RUNNABLE
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
            self:finish()
        end
end


function MultipassWaypointPathRunnable:processSecondRunnable()
        local try_ok, try_error = pcall(function()
            local geographicMapCellPosition = self.pathFindingLayer:getCurrentGeographicMapCellPosition()
            local localPathFindingInfo = self.pathFindingInfo
            self.list = self.targetPathFindingLayer:getWaypointBehavior():getWaypoint():getPathsList(geographicMapCellPosition, localPathFindingInfo, self.multipassState)
            if self.list ~= self.basicArrayListUtil:getImmutableInstance() then
                self.END_RUNNABLE:run()
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
            self:finish()
        end
end


function MultipassWaypointPathRunnable:processEndRunnable()
        local try_ok, try_error = pcall(function()
            local waypointBehavior = self.pathFindingLayer:getWaypointBehavior()
            waypointBehavior:setWaypointPathsList(self.list)
            self.pathFindingLayer:getWaypointRunnableLogHelper():end_(self.pathFindingLayer)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
        end
        self:finish()
end

return MultipassWaypointPathRunnable

