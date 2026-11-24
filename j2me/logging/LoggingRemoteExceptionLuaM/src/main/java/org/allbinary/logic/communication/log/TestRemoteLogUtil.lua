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
-- package org.allbinary.logic.communication.log

local TestRemoteLogUtil = {}
package.loaded["org.allbinary.logic.communication.log.TestRemoteLogUtil"] = TestRemoteLogUtil

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

local Globals = java_lazy("org.allbinary.globals.Globals")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

-- class table TestRemoteLogUtil is declared before the requires
TestRemoteLogUtil.__index = TestRemoteLogUtil
TestRemoteLogUtil.className = "TestRemoteLogUtil"
TestRemoteLogUtil.javaClassName = "org.allbinary.logic.communication.log.TestRemoteLogUtil"


function TestRemoteLogUtil._jinit(self)
        Globals.getInstance():init(getmetatable(self):getClassLoader(), TestRemoteLogUtil.PATH)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        logUtil:put(commonStrings.EXCEPTION, "Test", "TestClass", require("java.lang.Exception").new("Pretend Exception"))
    return self
end

function TestRemoteLogUtil.new(...)
    local self = setmetatable({}, TestRemoteLogUtil)
    TestRemoteLogUtil._jinit(self, ...)
    return self
end


-- throws Exception
function TestRemoteLogUtil.main(args)
        TestRemoteLogUtil.new()
end

TestRemoteLogUtil.PATH = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\"

return TestRemoteLogUtil

