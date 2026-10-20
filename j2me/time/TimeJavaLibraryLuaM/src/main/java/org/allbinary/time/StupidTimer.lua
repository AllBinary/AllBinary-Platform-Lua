-- Generated Code Do Not Modify
-- package org.allbinary.time

local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ThreadObjectUtil = require("org.allbinary.thread.ThreadObjectUtil")

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

local StupidTimer = {}
StupidTimer.__index = StupidTimer
StupidTimer.className = "StupidTimer"

function StupidTimer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.nullUtil = NullUtil.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
end

function StupidTimer.new()
    local self = setmetatable({}, StupidTimer)
    self:_init_fields()
    return self
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
            if math.fmod(index, 10) == 0 then
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.VISIT, java_exception("Exception", tostring(StringMaker.new():append("Took Too Long: "):append(StringUtil.getInstance():toString(visitorInterface)))))
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

