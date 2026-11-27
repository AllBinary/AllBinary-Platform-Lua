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

local MultipassWaypointPathRunnable = {}
package.loaded["org.allbinary.game.layer.MultipassWaypointPathRunnable"] = MultipassWaypointPathRunnable

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local ARunnable = require("org.allbinary.thread.ARunnable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local MultipassState = java_lazy("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local WaypointPathRunnableBase = require("org.allbinary.game.layer.WaypointPathRunnableBase")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table MultipassWaypointPathRunnable is declared before the requires
MultipassWaypointPathRunnable.__index = MultipassWaypointPathRunnable
MultipassWaypointPathRunnable.className = "MultipassWaypointPathRunnable"
MultipassWaypointPathRunnable.javaClassName = "org.allbinary.game.layer.MultipassWaypointPathRunnable"
setmetatable(MultipassWaypointPathRunnable, {__index = WaypointPathRunnableBase})
local FirstRunnable = {}
    FirstRunnable.__index = FirstRunnable
    FirstRunnable.className = "FirstRunnable"
    FirstRunnable.javaClassName = "org.allbinary.game.layer.MultipassWaypointPathRunnable$FirstRunnable"
    setmetatable(FirstRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.FirstRunnable = FirstRunnable

    function FirstRunnable:_init_fields()
        if self.multipassWaypointPathRunnable == nil then self.multipassWaypointPathRunnable = nil end
    end
    

    function FirstRunnable._jinit(self, multipassWaypointPathRunnable)
        java_super_init(ARunnable, self)
        FirstRunnable._init_fields(self)
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end

    function FirstRunnable.new(...)
        local self = setmetatable({}, FirstRunnable)
        FirstRunnable._jinit(self, ...)
        return self
    end
    

    function FirstRunnable:run()
            self.multipassWaypointPathRunnable:processFirstRunnable()
    end
    java_overload(FirstRunnable, "run", 0)

--    private boolean first = true;
    local SecondRunnable = {}
    SecondRunnable.__index = SecondRunnable
    SecondRunnable.className = "SecondRunnable"
    SecondRunnable.javaClassName = "org.allbinary.game.layer.MultipassWaypointPathRunnable$SecondRunnable"
    setmetatable(SecondRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.SecondRunnable = SecondRunnable

    function SecondRunnable:_init_fields()
        if self.multipassWaypointPathRunnable == nil then self.multipassWaypointPathRunnable = nil end
    end
    

    function SecondRunnable._jinit(self, multipassWaypointPathRunnable)
        java_super_init(ARunnable, self)
        SecondRunnable._init_fields(self)
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end

    function SecondRunnable.new(...)
        local self = setmetatable({}, SecondRunnable)
        SecondRunnable._jinit(self, ...)
        return self
    end
    

    function SecondRunnable:run()
            self.multipassWaypointPathRunnable:processSecondRunnable()
    end
    java_overload(SecondRunnable, "run", 0)

local EndRunnable = {}
    EndRunnable.__index = EndRunnable
    EndRunnable.className = "EndRunnable"
    EndRunnable.javaClassName = "org.allbinary.game.layer.MultipassWaypointPathRunnable$EndRunnable"
    setmetatable(EndRunnable, {__index = ARunnable})
    MultipassWaypointPathRunnable.EndRunnable = EndRunnable

    function EndRunnable:_init_fields()
        if self.multipassWaypointPathRunnable == nil then self.multipassWaypointPathRunnable = nil end
    end
    

    function EndRunnable._jinit(self, multipassWaypointPathRunnable)
        java_super_init(ARunnable, self)
        EndRunnable._init_fields(self)
            self.multipassWaypointPathRunnable = multipassWaypointPathRunnable
        return self
    end

    function EndRunnable.new(...)
        local self = setmetatable({}, EndRunnable)
        EndRunnable._jinit(self, ...)
        return self
    end
    

    function EndRunnable:run()
            self.multipassWaypointPathRunnable:processEndRunnable()
    end
    java_overload(EndRunnable, "run", 0)


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
            error(require("java.lang.RuntimeException").new(), 0)
        end
        java_overload(o, "run", 0)
        return o
    end)()
    self.currentPassRunnable = self.FIRST_RUNNABLE
end


function MultipassWaypointPathRunnable._jinit(self)
    java_super_init(WaypointPathRunnableBase, self)
    MultipassWaypointPathRunnable._init_fields(self)
    return self
end

function MultipassWaypointPathRunnable.new(...)
    local self = setmetatable({}, MultipassWaypointPathRunnable)
    MultipassWaypointPathRunnable._jinit(self, ...)
    return self
end


function MultipassWaypointPathRunnable:setRunning(isRunning)
        self.runningP = isRunning
        if self.runningP then
            self:reset()
            self.done = false
        end
end
java_overload(MultipassWaypointPathRunnable, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function MultipassWaypointPathRunnable:run()
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            self.currentPassRunnable:run()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
        end
end
java_overload(MultipassWaypointPathRunnable, "run", 0)


function MultipassWaypointPathRunnable:reset2()
        self.multipassState.step = 0
        self.multipassState.iteration = 0
        self.multipassState.iteration2 = 0
        self.pathFindingInfo = NullUtil.getInstance().NULL_OBJECT
end
java_overload(MultipassWaypointPathRunnable, "reset2", 0)


function MultipassWaypointPathRunnable:finish()
        self:reset2()
        self.currentPassRunnable = self.ALREADY_ENDED_RUNNABLE
        self.done = true
end
java_overload(MultipassWaypointPathRunnable, "finish", 0)


function MultipassWaypointPathRunnable:isDone()
        return self.done
end
java_overload(MultipassWaypointPathRunnable, "isDone", 0)


function MultipassWaypointPathRunnable:reset()
        self:reset2()
        self.currentPassRunnable = self.FIRST_RUNNABLE
        self.done = false
end
java_overload(MultipassWaypointPathRunnable, "reset", 0)


function MultipassWaypointPathRunnable:processFirstRunnable()
        local try_ok, try_error, try_value = pcall(function()
            self.pathFindingLayer:getWaypointRunnableLogHelper():start(self.pathFindingLayer)
            self:reset2()
            local geographicMapCellPosition = self.pathFindingLayer:getCurrentGeographicMapCellPosition()
            if geographicMapCellPosition == nil then
                error(require("java.lang.Exception").new("Should never be running here"), 0)
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
            self:finish()
        end
end
java_overload(MultipassWaypointPathRunnable, "processFirstRunnable", 0)


function MultipassWaypointPathRunnable:processSecondRunnable()
        local try_ok, try_error, try_value = pcall(function()
            local geographicMapCellPosition = self.pathFindingLayer:getCurrentGeographicMapCellPosition()
            local localPathFindingInfo = self.pathFindingInfo
            self.list = self.targetPathFindingLayer:getWaypointBehavior():getWaypoint():getPathsList(geographicMapCellPosition, localPathFindingInfo, self.multipassState)
            if self.list ~= self.basicArrayListUtil:getImmutableInstance() then
                self.END_RUNNABLE:run()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
            self:finish()
        end
end
java_overload(MultipassWaypointPathRunnable, "processSecondRunnable", 0)


function MultipassWaypointPathRunnable:processEndRunnable()
        local try_ok, try_error, try_value = pcall(function()
            local waypointBehavior = self.pathFindingLayer:getWaypointBehavior()
            waypointBehavior:setWaypointPathsList(self.list)
            self.pathFindingLayer:getWaypointRunnableLogHelper():end_(self.pathFindingLayer)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
        end
        self:finish()
end
java_overload(MultipassWaypointPathRunnable, "processEndRunnable", 0)

return MultipassWaypointPathRunnable

