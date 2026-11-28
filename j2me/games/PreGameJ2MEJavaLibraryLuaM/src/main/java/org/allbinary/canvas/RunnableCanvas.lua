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
-- package org.allbinary.canvas

local RunnableCanvas = {}
package.loaded["org.allbinary.canvas.RunnableCanvas"] = RunnableCanvas

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

local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local NullWaitGameRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local ABSystemWrapper = java_lazy("org.allbinary.logic.ABSystemWrapper")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NullThread = java_lazy("org.allbinary.thread.NullThread")
local RunnableInterface = java_lazy("org.allbinary.thread.RunnableInterface")
local ThreadObjectUtil = java_lazy("org.allbinary.thread.ThreadObjectUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local RunnableCanvasRefreshHelper = java_lazy("org.allbinary.canvas.RunnableCanvasRefreshHelper")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table RunnableCanvas is declared before the requires
RunnableCanvas.__index = RunnableCanvas
RunnableCanvas.className = "RunnableCanvas"
RunnableCanvas.javaClassName = "org.allbinary.canvas.RunnableCanvas"
setmetatable(RunnableCanvas, {__index = MyCanvas})
RunnableCanvas.java_implements = " RunnableInterface "
RunnableCanvas.java_interfaces = function() return {RunnableInterface} end

function RunnableCanvas:_init_fields()
    self.nullUtil = NullUtil.getInstance()
    self.stdUtil = StdUtil.getInstance()
    self.systemWrapper = ABSystemWrapper.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.thread = NullThread.NULL_THREAD
    self.currentThread = NullThread.NULL_THREAD
    if self.running == nil then self.running = false end
    self.loopTimeHelper = TimeDelayHelper.new(NullWaitGameRunnable.getInstance().WAIT)
    self.runnableCanvasRefreshHelper = Processor.getInstance()
    self.commonLabels = CommonLabels.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
    self.SET_RUNNING = "setRunning"
    self.IS_RUNNING = "isRunning"
    self.THREAD = "Thread: "
    self.NOT_EQUAL = " != "
    self.PAUSE_SLEEP = "pause sleep"
    self.START_PAUSE = "start pause - game thread sleep at: "
    self.END_PAUSE = "end pause - game thread sleep at: "
    self.PROCESS_LOOP_SLEEP = "processLoopSleep"
    self.pauseWait = 0
    self.notified = false
end


function RunnableCanvas._jinit(self, commandListener, childNameList, hasParam)
    java_super_init(MyCanvas, self, CommonStrings.getInstance().UNKNOWN, childNameList)
    RunnableCanvas._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(tostring(StringMaker.new():append("RunnableCanvas delay: "):appendint(java_int(self.loopTimeHelper.delay))), self, self.commonStrings.CONSTRUCTOR)
        self.runnableCanvasRefreshHelper = RunnableCanvasRefreshHelper.new(self)
        if not rawequal(commandListener, nil) then
            self:initCommands(commandListener)
        elseif hasParam then
            self.logUtil:putF("commandListener was null", self, "initCommands")
        end
    return self
end

function RunnableCanvas.new(...)
    local self = setmetatable({}, RunnableCanvas)
    RunnableCanvas._jinit(self, ...)
    return self
end


function RunnableCanvas:initCommands(cmdListener)
        self.logUtil:putF(self.commonStrings.NOT_IMPLEMENTED, self, "initCommands")
end
java_overload(RunnableCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function RunnableCanvas:isMainCanvas()
        if not rawequal(self:getCustomCommandListener(), nil) then
            return true
        else
            return false
        end
end
java_overload(RunnableCanvas, "isMainCanvas", 0)


function RunnableCanvas:setThread(thread)
        self.thread = thread
end
java_overload(RunnableCanvas, "setThread", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Thread")) end)


function RunnableCanvas:setRunning(running)
        self.running = running
        if not (self.running) then
            self.thread = NullThread.NULL_THREAD
            do -- synchronized (self)
                self.threadObjectUtil:notifyObject(self)
            end
        end
        self.logUtil:putF(tostring(StringMaker.new():append(self.IS_RUNNING):appendboolean(self.running)), self, self.SET_RUNNING)
end
java_overload(RunnableCanvas, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function RunnableCanvas:isRunning()
        if rawequal(self.thread, self.currentThread) then
            return self.running
        else
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.THREAD)
            if not rawequal(self.thread, nil) then
                stringBuffer:append(tostring(self.thread))
            end
            stringBuffer:append(self.NOT_EQUAL)
            if not rawequal(self.currentThread, nil) then
                stringBuffer:append(StringUtil.getInstance():toString(self.currentThread))
            end
            self.logUtil:putF(tostring(stringBuffer), self, self.IS_RUNNING)
            return false
        end
end
java_overload(RunnableCanvas, "isRunning", 0)


function RunnableCanvas:getLoopTimeHelperP()
        return self.loopTimeHelper
end
java_overload(RunnableCanvas, "getLoopTimeHelperP", 0)


function RunnableCanvas:setWait(wait)
        self.loopTimeHelper.delay = wait
        self.pauseWait = wait * 3
        self.logUtil:putF(tostring(StringMaker.new():append("setWait - delay: "):appendint(java_int(self.loopTimeHelper.delay))), self, self.commonStrings.CONSTRUCTOR)
end
java_overload(RunnableCanvas, "setWait", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RunnableCanvas:getWait()
        return self.loopTimeHelper.delay
end
java_overload(RunnableCanvas, "getWait", 0)


function RunnableCanvas:setCurrentThread()
        self.currentThread = require("java.lang.Thread").currentThread()
end
java_overload(RunnableCanvas, "setCurrentThread", 0)


function RunnableCanvas:setCurrentThreadFake()
        self.currentThread = self.thread
end
java_overload(RunnableCanvas, "setCurrentThreadFake", 0)


function RunnableCanvas:showNotify()
        local try_ok, try_error, try_value = pcall(function()
            self:stopWaiting()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "showNotify", e)
        end
end
java_overload(RunnableCanvas, "showNotify", 0)


-- throws Exception
function RunnableCanvas:stopWaiting()
        self.notified = true
        do -- synchronized (self)
            self.threadObjectUtil:notifyObject(self)
        end
        self:repaint()
end
java_overload(RunnableCanvas, "stopWaiting", 0)


-- throws Exception
function RunnableCanvas:waitOnNotify(wait)
        if not (self.notified) then
            if wait > 0 then
                self.threadObjectUtil:waitObjectFor(self, wait)
            else
                self.threadObjectUtil:waitObject(self)
            end
        end
end
java_overload(RunnableCanvas, "waitOnNotify", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function RunnableCanvas:processSleep()
        require("java.lang.Thread").sleep(self.pauseWait)
end
java_overload(RunnableCanvas, "processSleep", 0)


function RunnableCanvas:isPausable()
        return false
end
java_overload(RunnableCanvas, "isPausable", 0)


-- throws Exception
function RunnableCanvas:processGameSleep(sleep)
        require("java.lang.Thread").sleep(sleep)
end
java_overload(RunnableCanvas, "processGameSleep", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function RunnableCanvas:processLoopSleep()
        self.runnableCanvasRefreshHelper:process()
        if self:isPaused() then
            local stringMaker = StringMaker.new()
            if self:isRunning() and not (self:isSingleThread()) then
                stringMaker:delete(0, stringMaker:length())
                local currentTimeMillis = self.systemWrapper:currentTimeMillis()
                self.logUtil:putF(tostring(stringMaker:append(self.START_PAUSE):appendlong(currentTimeMillis):append(self.PAUSE_SLEEP):appendlong(self.pauseWait)), self, self.PROCESS_LOOP_SLEEP)
                while self:isPaused() and self:isRunning() and not (self:isSingleThread()) do
                    self:processSleep()
                    if not (self:isPausable()) then
                        stringMaker:delete(0, stringMaker:length())
                        self.logUtil:putF(tostring(stringMaker:append(self.END_PAUSE):appendlong(currentTimeMillis)), self, self.PROCESS_LOOP_SLEEP)
                        return
                    end
                end
            end
        end
        local elapsedTime = self.loopTimeHelper:getElapsedTNT()
        local wait = java_int(self.loopTimeHelper.delay)
        if elapsedTime > wait then
            elapsedTime = wait
        else
            self:processGameSleep(wait - elapsedTime)
        end
end
java_overload(RunnableCanvas, "processLoopSleep", 0)


function RunnableCanvas:isSingleThread()
        return false
end
java_overload(RunnableCanvas, "isSingleThread", 0)


function RunnableCanvas:run()
        self:setCurrentThread()
end
java_overload(RunnableCanvas, "run", 0)


-- throws Exception
function RunnableCanvas:end2()
end
java_overload(RunnableCanvas, "end2", 0)


function RunnableCanvas:getType()
        return -1
end
java_overload(RunnableCanvas, "getType", 0)

return RunnableCanvas

