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
-- package org.allbinary.logic.system.security.licensing

local PartnerIdentifierFileUtil = {}
package.loaded["org.allbinary.logic.system.security.licensing.PartnerIdentifierFileUtil"] = PartnerIdentifierFileUtil

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

local InputStream = java_lazy("java.io.InputStream")
local InputStreamReader = java_lazy("java.io.InputStreamReader")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table PartnerIdentifierFileUtil is declared before the requires
PartnerIdentifierFileUtil.__index = PartnerIdentifierFileUtil
PartnerIdentifierFileUtil.className = "PartnerIdentifierFileUtil"
PartnerIdentifierFileUtil.javaClassName = "org.allbinary.logic.system.security.licensing.PartnerIdentifierFileUtil"

function PartnerIdentifierFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.FILE_NAME = "partner.txt"
end

function PartnerIdentifierFileUtil._jinit(self)
    PartnerIdentifierFileUtil._init_fields(self)
    return self
end

function PartnerIdentifierFileUtil.new()
    return PartnerIdentifierFileUtil._jinit(setmetatable({}, PartnerIdentifierFileUtil))
end


function PartnerIdentifierFileUtil.getInstance()
        return PartnerIdentifierFileUtil.instance_f
end


function PartnerIdentifierFileUtil:get()
        local try_ok, try_error, try_value = pcall(function()
            local resourceUtil = ResourceUtil.getInstance()
            local inputStream = resourceUtil:getResourceAsStream(self.FILE_NAME)
            local inputStreamReader = InputStreamReader.new(inputStream)
            local chars = java_new_array("\0", 30)
            local size = inputStreamReader:read(chars)
            local partnerString = StringUtil.getInstance().EMPTY_STRING
            if size > 0 then
                partnerString = (function(value, offset, count) local parts = {} for index = offset + 1, offset + count do local item = value[index] if type(item) == "string" then parts[#parts + 1] = item else parts[#parts + 1] = string.char(item & 0xFF) end end return table.concat(parts) end)(chars, 0, size)
            end
            inputStreamReader:close()
            do return "__jreturn", partnerString end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET, e)
            return StringUtil.getInstance().NULL_STRING
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

PartnerIdentifierFileUtil.instance_f = PartnerIdentifierFileUtil.new()

return PartnerIdentifierFileUtil

