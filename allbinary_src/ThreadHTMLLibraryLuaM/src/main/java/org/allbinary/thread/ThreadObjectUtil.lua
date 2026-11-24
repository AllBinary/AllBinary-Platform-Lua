-- Generated Code Do Not Modify
-- package org.allbinary.thread

local ThreadObjectUtil = {}
package.loaded["org.allbinary.thread.ThreadObjectUtil"] = ThreadObjectUtil

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

local NullPriorityRunnable = java_lazy("org.allbinary.thread.NullPriorityRunnable")
local PriorityRunnable = java_lazy("org.allbinary.thread.PriorityRunnable")

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

-- class table ThreadObjectUtil is declared before the requires
ThreadObjectUtil.__index = ThreadObjectUtil
ThreadObjectUtil.className = "ThreadObjectUtil"
ThreadObjectUtil.javaClassName = "org.allbinary.thread.ThreadObjectUtil"

function ThreadObjectUtil:_init_fields()
    self.NULL_PRIORITY_RUNNABLE = NullPriorityRunnable.new()
end

function ThreadObjectUtil._jinit(self)
    ThreadObjectUtil._init_fields(self)
    return self
end

function ThreadObjectUtil.new()
    return ThreadObjectUtil._jinit(setmetatable({}, ThreadObjectUtil))
end


function ThreadObjectUtil.getInstance()
        return ThreadObjectUtil.instance_f
end


function ThreadObjectUtil:notifyObject(anyType)
end


-- throws Exception
function ThreadObjectUtil:waitObject(anyType)
end


-- throws Exception
function ThreadObjectUtil:waitObjectFor(anyType, delay)
end


function ThreadObjectUtil:processThread(runnable)
        runnable:run()
end

ThreadObjectUtil.instance_f = ThreadObjectUtil.new()

return ThreadObjectUtil

