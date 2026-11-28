-- Generated Code Do Not Modify
-- package org.allbinary.time

local StupidTimer = {}
package.loaded["org.allbinary.time.StupidTimer"] = StupidTimer

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
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ThreadObjectUtil = java_lazy("org.allbinary.thread.ThreadObjectUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

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

-- class table StupidTimer is declared before the requires
StupidTimer.__index = StupidTimer
StupidTimer.className = "StupidTimer"
StupidTimer.javaClassName = "org.allbinary.time.StupidTimer"

function StupidTimer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.nullUtil = NullUtil.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
end

function StupidTimer._jinit(self)
    StupidTimer._init_fields(self)
    return self
end

function StupidTimer.new()
    return StupidTimer._jinit(setmetatable({}, StupidTimer))
end


function StupidTimer:visitBool(visitorInterface)
        local result = visitorInterface:visit(self.nullUtil.NULL_OBJECT)
        local result2 = result
        return result2
end


-- throws Exception
function StupidTimer:visit(visitorInterface, timeDelayHelper)
        local tookTooLong = false
        local WAITING_FOR = "Waiting for: "
        PreLogUtil.put(tostring(StringMaker.new():append(WAITING_FOR):append(StringUtil.getInstance():toString(visitorInterface))), self, self.commonStrings.VISIT)
        local index = 0
        while self:visitBool(visitorInterface) do
            if rawequal(math.fmod(index, 10), 0) then
                PreLogUtil.put(tostring(StringMaker.new():append(WAITING_FOR):appendint(index)), self, self.commonStrings.VISIT)
            end
            index = index + 1
            do -- synchronized (self)
                self.threadObjectUtil:waitObjectFor(self, 1800)
            end
            if timeDelayHelper:isTimeTNT() then
                tookTooLong = true
                break
            end
        end
        if tookTooLong then
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.VISIT, require("java.lang.Exception").new(tostring(StringMaker.new():append("Took Too Long: "):append(StringUtil.getInstance():toString(visitorInterface)))))
        else
            PreLogUtil.put(tostring(timeDelayHelper), self, self.commonStrings.VISIT)
        end
end


-- throws Exception
function StupidTimer:stopWaiting()
        do -- synchronized (self)
            self.threadObjectUtil:notifyObject(self)
        end
end

return StupidTimer

